import 'database_connection.dart';

abstract class Driver {
  /// Initializes the driver.
  Future<void> init();

  /// Destroys the driver.
  Future<void> destroy();

  /// Acquires a connection from the driver.
  Future<DatabaseConnection> acquireConnection();

  /// Releases a connection back to the driver.
  Future<void> releaseConnection(DatabaseConnection connection);

  /// Begins a transaction.
  Future<void> beginTransaction(DatabaseConnection connection);

  /// Commits a transaction.
  Future<void> commitTransaction(DatabaseConnection connection);

  /// Rolls back a transaction.
  Future<void> rollbackTransaction(DatabaseConnection connection);
}
