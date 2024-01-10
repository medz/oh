import 'dart:async';

import 'dialect/database_introspector.dart';
import 'dialect/dialect.dart';
import 'driver/connection_provider.dart';
import 'driver/driver.dart';
import 'driver/runtime_driver.dart';
import 'query_creator.dart';
import 'query_executor/query_executor.dart';
import 'schema/schema.dart';
import 'specs/with_spec.dart';

class Oh<DB> extends QueryCreator<DB> {
  final Dialect<DB> _dialect;
  final QueryExecutor<DB> _executor;
  final WithSpec? _withSpec;
  final Driver _driver;

  const Oh._({
    required QueryExecutor<DB> executor,
    required Dialect<DB> dialect,
    WithSpec? withSpec,
    required Driver driver,
  })  : _executor = executor,
        _dialect = dialect,
        _withSpec = withSpec,
        _driver = driver,
        super(executor: executor, withSpec: withSpec);

  factory Oh(Dialect<DB> dialect) {
    final driver = RuntimeDriver(dialect.createDriver);
    final executor = QueryExecutor<DB>(
      compiler: dialect.createQueryCompiler(),
      adapter: dialect.createAdapter(),
      connectionProvider: ConnectionProvider(driver),
    );

    return Oh._(
      executor: executor,
      dialect: dialect,
      driver: driver,
    );
  }

  /// Current oh is transaction.
  bool get isTransaction => false;

  /// Returns a database introspector.
  DatabaseIntrospector get introspector => _dialect.createIntrospector(this);

  /// Returns the oh schema.
  Schema<DB> get schema => Schema(_executor);

  /// Returns value in interactive transaction.
  Future<T> transaction<T>(
    Future<T> Function(Oh<DB> transaction) execute, {
    IsolationLevel? isolationLevel,
  }) async {
    if (isTransaction) {
      throw Exception('Cannot start a transaction inside another transaction.');
    }

    return _executor.privideConnection((connection) async {
      final executor = _executor.withConnectionProvider(
        ConnectionProvider.single(connection),
      );
      final transaction = _Transaction(
        dialect: _dialect,
        executor: executor,
        driver: _driver,
        withSpec: _withSpec,
      );

      try {
        await _driver.beginTransaction(connection,
            isolationLevel: isolationLevel);
        final result = await execute(transaction);
        await _driver.commitTransaction(connection);

        return result;
      } catch (e) {
        await _driver.rollbackTransaction(connection);

        rethrow;
      }
    });
  }
}

class _Transaction<DB, Data> extends Oh<DB> {
  const _Transaction({
    required super.dialect,
    required super.driver,
    required super.executor,
    super.withSpec,
  }) : super._();

  @override
  bool get isTransaction => true;
}
