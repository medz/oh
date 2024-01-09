import 'dialect/dialect.dart';
import 'driver/connection_provider.dart';
import 'driver/database_connection.dart';
import 'driver/driver.dart';
import 'query_compiler/compiled_query.dart';
import 'query_executor/query_executor.dart';
import 'query_executor/query_identifier.dart';
import 'specs/statement_spec.dart';

abstract interface class Oh<DB> implements QueryExecutor<DB> {
  /// Creates a new oh instance.
  factory Oh({required Dialect<DB> dialect}) = _Impl<DB>;
}

class _Impl<DB> implements Oh<DB> {
  final Dialect<DB> dialect;
  late final Driver driver;
  late final QueryExecutor<DB> executor;

  _Impl({required this.dialect}) {
    driver = dialect.createDriver();
    executor = QueryExecutor(
      compiler: dialect.createQueryCompiler(),
      adapter: dialect.createAdapter(),
      connectionProvider: ConnectionProvider(driver),
    );
  }

  @override
  CompiledQuery<T> compile<T>(StatementSpec statement) {
    return executor.compile(statement);
  }

  @override
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier) {
    return executor.execute(query, identifier);
  }

  @override
  Future<T> privideConnection<T>(
      Future<T> Function(DatabaseConnection connection) consumer) {
    return executor.privideConnection(consumer);
  }

  @override
  Stream<QueryResult<T>> stream<T>(
    CompiledQuery<T> query,
    QueryIdentifier identifier, {
    int? chunkSize,
  }) {
    return executor.stream(query, identifier, chunkSize: chunkSize);
  }
}
