import 'connection.dart';

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

  /// Destroys the driver and releases all resources.
  Future<void> dispose();

  /// Acquires a new connection from the pool.
  Future<Connection> acquireConnection();

  /// Releases a connection back to the pool.
  Future<void> releaseConnection(Connection connection);

  /// Begins a transaction.
  Future<void> beginTransaction(
    Connection connection, {
    IsolationLevel? isolationLevel,
  });

  /// Commits the transaction.
  Future<void> commitTransaction(Connection connection);

  /// Rolls back a transaction.
  Future<void> rollbackTransaction(Connection connection);
}
