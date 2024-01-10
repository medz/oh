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
}
