abstract interface class DialectAdapter {
  /// Whether or not this dialect supports `if not exists` in creation of
  /// tables/schemas/views/etc.
  bool get supportsCreateIfNotExists;

  /// Whether or not this dialect supports transactional DDL.
  bool get supportsTransactionalDdl;

  /// Whether or not this dialect supports the `returning` in inserts, updates
  /// and deletes.
  bool get supportsReturning;
}
