abstract class DialectAdapter {
  const DialectAdapter();

  /// Whether or not this dialect supports `if not exists` in creation of
  /// tables/schemas/views/etc.
  bool get supportsCreateIfNotExists => true;

  /// Whether or not this dialect supports transactional DDL.
  bool get supportsTransactionalDdl => true;

  /// Whether or not this dialect supports the `returning` in inserts, updates
  /// and deletes.
  bool get supportsReturning => true;
}
