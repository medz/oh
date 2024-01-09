import '../driver/driver.dart';
import '../driver/dummy/dummy_driver.dart';
import '../oh.dart';
import '../query_compiler/query_compiler.dart';
import 'database_introspector.dart';
import 'dialect_adapter.dart';

/// Default, Unprovided, Dialect factory.
Never _unprovidedDialectFactory(String name) {
  throw StateError('Dialect $name is not provided.');
}

abstract interface class Dialect<T> {
  /// Creates a dialect form factory methods.
  factory Dialect({
    DialectAdapter Function()? adapter,
    Driver Function()? driver,
    DatabaseIntrospector Function(Oh<T> oh)? introspector,
    QueryCompiler Function()? compiler,
  }) {
    return _FactoryDialect(
      adapter: adapter ?? _unprovidedDialectFactory('adapter'),
      dirver: driver ?? DummyDriver.new,
      introspector: introspector ?? _unprovidedDialectFactory('introspector'),
      compiler: compiler ?? _unprovidedDialectFactory('query compiler'),
    );
  }

  /// Create a new [Driver] for the dialect.
  Driver createDriver();

  /// Creates a query compiler for the dialect.
  QueryCompiler createQueryCompiler();

  /// Creates an adapter for the dialect.
  DialectAdapter createAdapter();

  /// Creates a new database introspector for the dialect.
  DatabaseIntrospector createIntrospector(Oh<T> oh);
}

/// Provides factory methods for dialects.
class _FactoryDialect<T> implements Dialect<T> {
  final DialectAdapter Function() adapter;
  final Driver Function() dirver;
  final DatabaseIntrospector Function(Oh<T> oh) introspector;
  final QueryCompiler Function() compiler;

  const _FactoryDialect({
    required this.adapter,
    required this.dirver,
    required this.introspector,
    required this.compiler,
  });

  @override
  DialectAdapter createAdapter() => adapter();

  @override
  Driver createDriver() => dirver();

  @override
  DatabaseIntrospector createIntrospector(Oh<T> oh) => introspector(oh);

  @override
  QueryCompiler createQueryCompiler() => compiler();
}
