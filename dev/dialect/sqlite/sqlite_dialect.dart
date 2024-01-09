import '../../driver/driver.dart';
import '../../oh.dart';
import '../../query_compiler/query_compiler.dart';
import '../database_introspector.dart';
import '../dialect.dart';
import '../dialect_adapter.dart';
import 'sqlite_adapter.dart';

class SQLiteDialect implements Dialect {
  @override
  DialectAdapter createAdapter() => const SQLiteAdapter();

  @override
  Driver createDriver() {
    // TODO: implement createDriver
    throw UnimplementedError();
  }

  @override
  DatabaseIntrospector createIntrospector(Oh oh) {
    // TODO: implement createIntrospector
    throw UnimplementedError();
  }

  @override
  QueryCompiler createQueryCompiler() {
    // TODO: implement createQueryCompiler
    throw UnimplementedError();
  }
}
