import 'dart:async';

import '../dialect/dialect_adapter.dart';
import '../driver/connection_provider.dart';
import '../driver/database_connection.dart';
import '../query_compiler/compiled_query.dart';
import '../query_compiler/query_compiler.dart';
import '../specs/statement_spec.dart';
import 'query_identifier.dart';

abstract interface class QueryExecutor<DB> implements ConnectionProvider {
  /// Compiles a [statement] into a [CompiledQuery].
  CompiledQuery<T> compile<T>(StatementSpec statement);

  /// Executes a query and returns [QueryResult].
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier);

  /// Stream the query results.
  Stream<QueryResult<T>> stream<T>(
    CompiledQuery<T> query,
    QueryIdentifier identifier, {
    int? chunkSize,
  });

  const factory QueryExecutor({
    required QueryCompiler compiler,
    required DialectAdapter adapter,
    required ConnectionProvider connectionProvider,
  }) = _InnerQueryExecutor<DB>;
}

class _InnerQueryExecutor<DB> implements QueryExecutor<DB> {
  final QueryCompiler compiler;
  final DialectAdapter adapter;
  final ConnectionProvider connectionProvider;

  const _InnerQueryExecutor({
    required this.compiler,
    required this.adapter,
    required this.connectionProvider,
  });

  @override
  CompiledQuery<T> compile<T>(StatementSpec statement) =>
      compiler.compile(statement);

  @override
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier) {
    return privideConnection((connection) async {
      final result = await connection.execute<T>(query);
      return result;
    });
  }

  @override
  Future<T> privideConnection<T>(
      Future<T> Function(DatabaseConnection connection) consumer) {
    return connectionProvider.privideConnection(consumer);
  }

  @override
  Stream<QueryResult<T>> stream<T>(
    CompiledQuery<T> query,
    QueryIdentifier identifier, {
    int? chunkSize,
  }) async* {
    final connection = await connectionProvider.privideConnection(
      (connection) async => connection,
    );

    yield* connection.stream(query, chunkSize: chunkSize);
  }
}
