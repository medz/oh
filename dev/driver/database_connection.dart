import '../query_compiler/compiled_query.dart';

abstract interface class DatabaseConnection {
  /// Executes a query and returns [QueryResult].
  Future<QueryResult<T>> execute<T>(CompiledQuery<T> query);

  /// Stream the query results.
  Stream<QueryResult<T>> stream<T>(CompiledQuery<T> query, {int? chunkSize});
}

class QueryResult<T> {
  final int? affectedRows;
  final int? changedRows;
  final int? lastInsertId;
  final Iterable<T> rows;

  const QueryResult({
    this.affectedRows,
    this.changedRows,
    this.lastInsertId,
    required this.rows,
  });
}
