import '../database_connection.dart';
import '../driver.dart';
import 'dummy_connection.dart';

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
