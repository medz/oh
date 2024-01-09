import 'database_connection.dart';

abstract interface class ConnectionProvider {
  Future<T> privideConnection<T>(
    Future<T> Function(DatabaseConnection connection) consumer,
  );
}
