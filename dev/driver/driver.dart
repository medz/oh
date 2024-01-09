import 'database_connection.dart';

enum IsolationLevel {
  readUncommitted,
  readCommitted,
  repeatableRead,
  serializable,
  snapshot,
}

abstract interface class Driver {
  /// Initializes the driver.
  Future<void> init();

  /// Disposes the driver.
  Future<void> dispose();

  /// Acquires a new connection from the pool.
  Future<DatabaseConnection> acquireConnection();

  /// Releases a connection back to the pool.
  Future<void> releaseConnection(DatabaseConnection connection);

  /// Begins a transaction.
  Future<void> beginTransaction(DatabaseConnection connection,
      {IsolationLevel? isolationLevel});

  /// Commits a transaction.
  Future<void> commitTransaction(DatabaseConnection connection);

  /// Rolls back a transaction.
  Future<void> rollbackTransaction(DatabaseConnection connection);
}
