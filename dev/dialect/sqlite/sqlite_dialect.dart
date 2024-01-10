import '../../driver/database_connection.dart';
import '../../driver/driver.dart';
import '../../oh.dart';
import '../../query_compiler/query_compiler.dart';
import '../database_introspector.dart';
import '../dialect.dart';
import '../dialect_adapter.dart';
import 'sqlite.dart';
import 'sqlite_adapter.dart';
import 'sqlite_driver.dart';
import 'sqlite_spec_visitor.dart';

class SQLiteDialect implements Dialect<SQLite> {
  final Future<SQLite> Function() _factory;
  final Future<void> Function(DatabaseConnection)? _onCreateConnection;

  const SQLiteDialect({
    required Future<SQLite> Function() factory,
    Future<void> Function(DatabaseConnection connection)? onCreateConnection,
  })  : _factory = factory,
        _onCreateConnection = onCreateConnection;

  @override
  DialectAdapter createAdapter() => const SQLiteAdapter();

  @override
  Driver createDriver() {
    return SQLiteDriver(
      factory: _factory,
      onCreateConnection: _onCreateConnection,
    );
  }

  @override
  QueryCompiler createQueryCompiler() {
    const visitor = SQLiteSpecVisitor();
    return const QueryCompiler(visitor);
  }

  @override
  DatabaseIntrospector createIntrospector(Oh<SQLite> oh) {
    // TODO: implement createIntrospector
    throw UnimplementedError();
  }
}
