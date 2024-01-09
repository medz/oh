abstract interface class DatabaseIntrospector {
  /// Returns the database schema metadata.
  Future<Iterable<SchemaMetadata>> getSchema();

  /// Returns the database table metadata.
  Future<Iterable<TableMetadata>> getTables();
}

class SchemaMetadata {
  /// The schema name.
  final String name;

  const SchemaMetadata(this.name);
}

class TableMetadata {
  /// The table name.
  final String name;

  /// Whether the table is a view.
  final bool isView;

  /// The table columns.
  final Iterable<ColumnMetadata> columns;

  /// The table owner schema.
  final String? schema;

  const TableMetadata({
    required this.name,
    required this.isView,
    required this.columns,
    this.schema,
  });
}

class ColumnMetadata {
  /// The column name.
  final String name;

  /// The column data type.
  final String dataType;

  /// The column data type schema.
  final String? dataTypeSchema;

  /// Whether the column is auto-incrementing.
  final bool isAutoIncrementing;

  /// Whether the column is nullable.
  final bool isNullable;

  /// Whether the column has a default value.
  final bool hasDefaultValue;

  const ColumnMetadata({
    required this.name,
    required this.dataType,
    this.dataTypeSchema,
    required this.isAutoIncrementing,
    required this.isNullable,
    required this.hasDefaultValue,
  });
}
