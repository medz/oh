import 'column_definition_node.dart';
import 'constraint_node.dart';
import 'modifier.dart';
import 'node.dart';
import 'table_node.dart';

enum OnCommitAction {
  preserveRows,
  deleteRows,
  drop,
}

class CreateTableNode implements RootNode {
  final TableNode table;
  final List<ColumnDefinitionNode> columns;
  final List<ConstraintNode> constraints;
  final bool ifNotExists;
  final bool temporary;
  final OnCommitAction? onCommit;
  final List<Modifier> modifiers;
  final Node? select;

  const CreateTableNode({
    required this.table,
    required this.columns,
    this.constraints = const [],
    this.ifNotExists = false,
    this.temporary = false,
    this.onCommit,
    this.modifiers = const [],
    this.select,
  });
}
