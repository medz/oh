import '../driver/driver.dart';
import '../oh.dart';
import '../query_compiler/query_compiler.dart';
import 'database_introspector.dart';
import 'dialect_adapter.dart';

abstract interface class Dialect<T> {
  /// Create a new [Driver] for the dialect.
  Driver createDriver();

  /// Creates a query compiler for the dialect.
  QueryCompiler createQueryCompiler();

  /// Creates an adapter for the dialect.
  DialectAdapter createAdapter();

  /// Creates a new database introspector for the dialect.
  DatabaseIntrospector createIntrospector(Oh<T> oh);
}
