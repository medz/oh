import '../../driver/database_connection.dart';
import '../../query_compiler/compiled_query.dart';
import 'sqlite.dart';

class SQLiteConnection implements DatabaseConnection {
  final SQLite _database;

  const SQLiteConnection(SQLite database) : _database = database;

  @override
  Future<QueryResult<T>> execute<T>(CompiledQuery<T> query) async {
    final stmt = _database.prepare(query.sql);
    if (stmt.reader) {
      return QueryResult<T>(
        rows: stmt.all(query.params).map((e) => e),
      );
    }

    final result = stmt.run(query.params);
    final affectedRows = result.affectedRows;

    return QueryResult<T>(
      affectedRows: affectedRows,
      lastInsertId: result.lastInsertId,
      rows: [],
    );
  }

  @override
  Stream<QueryResult<T>> stream<T>(CompiledQuery<T> query,
      {int? chunkSize}) async* {
    final result = await execute(query);
    for (final row in result.rows) {
      yield QueryResult<T>(rows: [row]);
    }
  }
}
