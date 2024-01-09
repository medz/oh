import '../dialect_adapter.dart';

class SQLiteAdapter extends DialectAdapter {
  const SQLiteAdapter();

  @override
  bool get supportsTransactionalDdl => false;
}
