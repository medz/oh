import '../driver/connection_provider.dart';
import '../driver/database_connection.dart';
import '../query_compiler/compiled_query.dart';
import '../specs/statement_spec.dart';
import 'query_identifier.dart';

abstract interface class QueryExecutor implements ConnectionProvider {
  /// Compiles a [statement] into a [CompiledQuery].
  CompiledQuery<T> compile<T>(
      StatementSpec statement, QueryIdentifier identifier);

  /// Executes a query and returns [QueryResult].
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier);

  /// Stream the query results.
  Stream<QueryResult<T>> stream<T>(
      CompiledQuery<T> query, QueryIdentifier identifier);
}
