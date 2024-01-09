import '../compiler/compiled_query.dart';
import 'query_identifier.dart';
import 'query_result.dart';

abstract interface class Executor {
  /// Executes a compiled query.
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier);

  /// Stream of executed queries.
  Stream<T> stream<T>(CompiledQuery<T> query, QueryIdentifier identifier);
}
