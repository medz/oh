import 'column_spec.dart';
import 'spec.dart';
import 'table_spec.dart';

enum OnModifyForeignAction {
  noAction,
  restrict,
  cascade,
  setNull,
  setDefault,
}

class ReferencesSpec implements Spec {
  final TableSpec table;
  final Iterable<ColumnSpec> columns;
  final OnModifyForeignAction? onDelete;
  final OnModifyForeignAction? onUpdate;

  const ReferencesSpec({
    required this.table,
    required this.columns,
    this.onDelete,
    this.onUpdate,
  });

  ReferencesSpec copyWith({
    TableSpec? table,
    Iterable<ColumnSpec>? columns,
    OnModifyForeignAction? onDelete,
    OnModifyForeignAction? onUpdate,
  }) {
    return ReferencesSpec(
      table: table ?? this.table,
      columns: columns ?? this.columns,
      onDelete: onDelete ?? this.onDelete,
      onUpdate: onUpdate ?? this.onUpdate,
    );
  }
}
