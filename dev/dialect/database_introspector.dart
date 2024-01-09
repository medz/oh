abstract interface class DatabaseIntrospector {
  /// Get schema metadata.
  Future<Iterable<String>> getSchemas();

  /// Get tables and views metadata.
  Future<Iterable<TableMetadata>> getTables();
}

class TableMetadata {
  final String name;
  final String? schema;
  final bool isView;
  final Iterable<ColumnMetadata> columns;

  const TableMetadata({
    required this.name,
    this.schema,
    required this.isView,
    required this.columns,
  });
}

class ColumnMetadata {
  final String name;
  final String type;
  final String? typeSchema;
  final bool isAutoIncrement;
  final bool isNullable;
  final bool hasDefaultValue;

  const ColumnMetadata({
    required this.name,
    required this.type,
    this.typeSchema,
    required this.isAutoIncrement,
    required this.isNullable,
    required this.hasDefaultValue,
  });
}
