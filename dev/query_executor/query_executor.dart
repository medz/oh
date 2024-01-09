import 'dart:async';

import '../dialect/dialect_adapter.dart';
import '../driver/connection_provider.dart';
import '../driver/database_connection.dart';
import '../query_compiler/compiled_query.dart';
import '../query_compiler/query_compiler.dart';
import '../specs/statement_spec.dart';
import 'query_identifier.dart';

class QueryExecutor<DB> implements ConnectionProvider {
  final QueryCompiler _compiler;
  final DialectAdapter _adapter;
  final ConnectionProvider _connectionProvider;

  const QueryExecutor({
    required QueryCompiler compiler,
    required DialectAdapter adapter,
    required ConnectionProvider connectionProvider,
  })  : _compiler = compiler,
        _adapter = adapter,
        _connectionProvider = connectionProvider;

  /// Compiles a [statement] into a [CompiledQuery].
  CompiledQuery<T> compile<T>(StatementSpec statement) =>
      _compiler.compile<T>(statement);

  /// Executes a query and returns [QueryResult].
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier) {
    return privideConnection((connection) => connection.execute(query));
  }

  /// Stream the query results.
  Stream<QueryResult<T>> stream<T>(
    CompiledQuery<T> query,
    QueryIdentifier identifier, {
    int? chunkSize,
  }) async* {
    yield* await privideConnection((connection) async {
      return connection.stream(query, chunkSize: chunkSize);
    });
  }

  /// Returns a new [QueryExecutor] with the given [connectionProvider].
  QueryExecutor<DB> withConnectionProvider(
      ConnectionProvider connectionProvider) {
    return QueryExecutor(
      compiler: _compiler,
      adapter: _adapter,
      connectionProvider: connectionProvider,
    );
  }

  @override
  Future<T> privideConnection<T>(
          Future<T> Function(DatabaseConnection connection) consumer) =>
      _connectionProvider.privideConnection(consumer);
}
