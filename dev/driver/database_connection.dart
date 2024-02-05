import '../compiler/compiler.dart';

abstract interface class DatabaseConnection {
  /// Executes a compiled SQL statement.
  Future<ExecutedResult<T>> execute<T>(CompiledResult<T> compiled);
}

class ExecutedResult<T> {
  /// The rows of the executed SQL statement.
  final List<T> rows;

  /// The number of rows affected by the executed SQL statement.
  final int? affectedRows;

  /// The last inserted row id.
  final int? lastInsertId;

  const ExecutedResult({
    required this.rows,
    this.affectedRows,
    this.lastInsertId,
  });
}
