import '../driver/database_connection.dart';

abstract interface class QueryExecutable<T> {
  /// Compiles self into a [QueryResult].
  Future<QueryResult<T>> execute();
}
