import '../dialect_adapter.dart';

class SQLiteAdapter implements DialectAdapter {
  const SQLiteAdapter();

  @override
  bool get supportsTransactionalDdl => false;

  @override
  bool get supportsCreateIfNotExists => true;

  @override
  bool get supportsReturning => true;
}
