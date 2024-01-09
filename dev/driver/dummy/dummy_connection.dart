import '../../query_compiler/compiled_query.dart';
import '../database_connection.dart';

class DummyConnection implements DatabaseConnection {
  const DummyConnection();

  @override
  Future<QueryResult<T>> execute<T>(CompiledQuery<T> query) async {
    return const QueryResult(rows: []);
  }

  @override
  Stream<QueryResult<T>> stream<T>(CompiledQuery<T> query, {int? chunkSize}) {
    return Stream<QueryResult<T>>.empty();
  }
}
