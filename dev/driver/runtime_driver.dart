import 'database_connection.dart';
import 'driver.dart';

/// A runtime driver that wraps a [Driver] instance.
///
/// This is a lifecycle driver that does not need to be initialized or disposed.
class RuntimeDriver implements Driver {
  final Driver Function() _factory;
  late final Driver _driver;

  bool _initialized = false;
  bool _disposed = false;

  RuntimeDriver(Driver Function() factory) : _factory = factory;

  @override
  Future<void> dispose() async {
    if (_disposed || !_initialized) return;

    _disposed = true;
    await _driver.dispose();
  }

  @override
  Future<void> init() async {
    if (_disposed) {
      throw StateError('Cannot initialize a disposed driver.');
    } else if (_initialized) {
      throw StateError('Cannot initialize an already initialized driver.');
    }

    _driver = _factory();
    _initialized = true;

    await _driver.init();
  }

  @override
  Future<DatabaseConnection> acquireConnection() async {
    if (_disposed) {
      throw StateError('Cannot acquire a connection from a disposed driver.');
    } else if (!_initialized) {
      await init();
    }

    return _driver.acquireConnection();
  }

  @override
  Future<void> releaseConnection(DatabaseConnection connection) =>
      _driver.releaseConnection(connection);

  @override
  Future<void> beginTransaction(DatabaseConnection connection,
      {IsolationLevel? isolationLevel}) {
    return _driver.beginTransaction(connection, isolationLevel: isolationLevel);
  }

  @override
  Future<void> commitTransaction(DatabaseConnection connection) {
    return _driver.commitTransaction(connection);
  }

  @override
  Future<void> rollbackTransaction(DatabaseConnection connection) {
    return _driver.rollbackTransaction(connection);
  }
}
