import 'dart:async';

import '../../driver/database_connection.dart';
import '../../driver/driver.dart';
import 'sqlite.dart';
import 'sqlite_connection.dart';

class SQLiteDriver implements Driver {
  final Future<SQLite> Function() _factory;
  final Future<void> Function(DatabaseConnection)? _onCreateConnection;
  final _ConnectionMutex _mutex = _ConnectionMutex();

  SQLite? _database;
  DatabaseConnection? _connection;

  SQLiteDriver({
    required Future<SQLite> Function() factory,
    Future<void> Function(DatabaseConnection connection)? onCreateConnection,
  })  : _factory = factory,
        _onCreateConnection = onCreateConnection;

  factory SQLiteDriver.from(
    SQLite database, {
    Future<void> Function(DatabaseConnection connection)? onCreateConnection,
  }) {
    return SQLiteDriver(
      factory: () => Future.value(database),
      onCreateConnection: onCreateConnection,
    );
  }

  @override
  Future<DatabaseConnection> acquireConnection() async {
    await _mutex.acquire();

    return _connection!;
  }

  @override
  Future<void> releaseConnection(DatabaseConnection connection) async {
    _mutex.release();
  }

  @override
  Future<void> beginTransaction(DatabaseConnection connection,
      {IsolationLevel? isolationLevel}) {
    // TODO: implement beginTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> commitTransaction(DatabaseConnection connection) {
    // TODO: implement commitTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> rollbackTransaction(DatabaseConnection connection) {
    // TODO: implement rollbackTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async {
    _database?.close();
  }

  @override
  Future<void> init() async {
    _database = await _factory();
    _connection = SQLiteConnection(_database!);

    if (_onCreateConnection != null) {
      await _onCreateConnection(_connection!);
    }
  }
}

class _ConnectionMutex {
  Completer<void>? _completer;

  Future<void> acquire() async {
    if (_completer != null) {
      await _completer!.future;
    }

    _completer = Completer();
  }

  void release() {
    _completer!.complete();
    _completer = null;
  }
}
