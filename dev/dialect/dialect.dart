import '../driver/driver.dart';
import '../executor/executor.dart';
import 'database_introspector.dart';
import 'dialect_adapter.dart';

abstract interface class Dialect<T> {
  /// Creates a new Executor.
  Executor createExecutor();

  /// Creates a new DialectAdapter.
  DialectAdapter<T> createAdapter();

  /// Creates a new database driver.
  Driver createDriver();

  /// Creates a new database introspector.
  DatabaseIntrospector createIntrospector();
}
