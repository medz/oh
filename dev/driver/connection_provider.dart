import 'dart:async';

import 'database_connection.dart';

abstract interface class ConnectionProvider {
  /// Provides a database connection.
  Future<T> provide<T>(
    FutureOr<T> Function(DatabaseConnection connection) consumer,
  );
}
