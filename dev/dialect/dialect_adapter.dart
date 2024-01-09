import '../oh.dart';

abstract interface class DialectAdapter<T> {
  bool get supportsCreateIfNotExists;
  bool get supportsTransactionalDdl;
  bool get supportsReturning;

  Future<void> acquireMigrationLock(
    Oh<T> oh, {
    required String lockTable,
    required String lockRowId,
    String? lockTableSchema,
  });

  Future<void> releaseMigrationLock(
    Oh<T> oh, {
    required String lockTable,
    required String lockRowId,
    String? lockTableSchema,
  });
}
