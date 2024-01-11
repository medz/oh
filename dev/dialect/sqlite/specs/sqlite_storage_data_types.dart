import '../../../specs/data_type_spec.dart';

final class SQLiteNullStorageDataTypeSpec implements DataTypeSpec {
  const SQLiteNullStorageDataTypeSpec();

  @override
  String get name => 'NULL';
}

final class SQLiteIntegerStorageDataTypeSpec implements DataTypeSpec {
  const SQLiteIntegerStorageDataTypeSpec();

  @override
  String get name => 'INTEGER';
}

final class SQLiteRealStorageDataTypeSpec implements DataTypeSpec {
  const SQLiteRealStorageDataTypeSpec();

  @override
  String get name => 'REAL';
}

final class SQLiteTextStorageDataTypeSpec implements DataTypeSpec {
  const SQLiteTextStorageDataTypeSpec();

  @override
  String get name => 'TEXT';
}

final class SQLiteBlobStorageDataTypeSpec implements DataTypeSpec {
  const SQLiteBlobStorageDataTypeSpec();

  @override
  String get name => 'BLOB';
}
