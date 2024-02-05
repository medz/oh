import 'column_node.dart';
import 'node.dart';
import 'table_node.dart';

enum OnModifyForeignAction {
  noAction,
  restrict,
  cascade,
  setNull,
  setDefault,
}

class ReferencesNode implements Node {
  final TableNode table;
  final List<ColumnNode> columns;
  final OnModifyForeignAction? onDelete;
  final OnModifyForeignAction? onUpdate;

  const ReferencesNode({
    required this.table,
    required this.columns,
    this.onDelete,
    this.onUpdate,
  });
}
