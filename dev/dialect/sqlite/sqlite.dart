abstract interface class SQLite {
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
