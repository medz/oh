import '../../driver/database_support.dart';

abstract interface class SQLite
    implements DatabaseSupportReturning, DatabaseSupportCreateIfNotExists {
  void close();
  SQLiteStatement prepare(String sql);
}

abstract interface class SQLiteStatement {
  bool get reader;
  Iterable all(Iterable params);
  SQLiteRunResult run(Iterable params);
}

class SQLiteRunResult {
  final int lastInsertId;
  final int affectedRows;
  SQLiteRunResult(this.lastInsertId, this.affectedRows);
}
