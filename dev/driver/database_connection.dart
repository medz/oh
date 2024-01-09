import '../query_compiler/compiled_query.dart';

abstract interface class DatabaseConnection {
  /// Executes a query and returns [QueryResult].
  Future<QueryResult<T>> execute<T>(CompiledQuery<T> query);

  /// Stream the query results.
  Stream<QueryResult<T>> stream<T>(CompiledQuery<T> query, {int? chunkSize});
}

class QueryResult<T> {
  final int? numAffectedRows;
  final int? numChangedRows;
  final int? lastInsertId;
  final Iterable<T> rows;

  const QueryResult({
    this.numAffectedRows,
    this.numChangedRows,
    this.lastInsertId,
    required this.rows,
  });
}
