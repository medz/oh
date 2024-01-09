import 'database_connection.dart';
import 'driver.dart';

abstract interface class ConnectionProvider {
  Future<T> privideConnection<T>(
    Future<T> Function(DatabaseConnection connection) consumer,
  );

  const factory ConnectionProvider(Driver driver) = _InnerConnectProvider;

  const factory ConnectionProvider.single(DatabaseConnection connection) =
      _SingleConnectionProvider;
}

class _InnerConnectProvider implements ConnectionProvider {
  final Driver driver;

  const _InnerConnectProvider(this.driver);

  @override
  Future<T> privideConnection<T>(
      Future<T> Function(DatabaseConnection connection) consumer) async {
    final connection = await driver.acquireConnection();
    try {
      return await consumer(connection);
    } finally {
      await driver.releaseConnection(connection);
    }
  }
}

class _SingleConnectionProvider implements ConnectionProvider {
  final DatabaseConnection _connection;

  const _SingleConnectionProvider(this._connection);

  @override
  Future<T> privideConnection<T>(
          Future<T> Function(DatabaseConnection connection) consumer) =>
      consumer(_connection);
}
