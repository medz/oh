import 'driver/database_connection.dart';
import 'query_compiler/compiled_query.dart';
import 'query_executor/query_executor.dart';
import 'query_executor/query_identifier.dart';
import 'specs/statement_spec.dart';

class Oh<DB> implements QueryExecutor {
  const Oh();

  @override
  CompiledQuery<T> compile<T>(
      StatementSpec statement, QueryIdentifier identifier) {
    // TODO: implement compile
    throw UnimplementedError();
  }

  @override
  Future<QueryResult<T>> execute<T>(
      CompiledQuery<T> query, QueryIdentifier identifier) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  Future<T> privideConnection<T>(
      Future<T> Function(DatabaseConnection connection) consumer) {
    // TODO: implement privideConnection
    throw UnimplementedError();
  }

  @override
  Stream<QueryResult<T>> stream<T>(
      CompiledQuery<T> query, QueryIdentifier identifier) {
    // TODO: implement stream
    throw UnimplementedError();
  }
}
