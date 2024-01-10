import '../query_compiler/compiled_query.dart';
import 'database_connection.dart';
import 'driver.dart';

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

class DummyDriver implements Driver {
  const DummyDriver();

  @override
  Future<DatabaseConnection> acquireConnection() async {
    return const DummyConnection();
  }

  @override
  Future<void> beginTransaction(DatabaseConnection connection,
      {IsolationLevel? isolationLevel}) async {}

  @override
  Future<void> commitTransaction(DatabaseConnection connection) async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<void> init() async {}

  @override
  Future<void> releaseConnection(DatabaseConnection connection) async {}

  @override
  Future<void> rollbackTransaction(DatabaseConnection connection) async {}
}
