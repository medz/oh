import '../compiler/compiled_query.dart';
import '../executor/query_result.dart';

abstract interface class Connection {
  Future<QueryResult<T>> execute<T>(CompiledQuery<T> query);
  Stream<T> stream<T>(CompiledQuery<T> query);
}
