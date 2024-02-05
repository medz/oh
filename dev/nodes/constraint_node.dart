import 'column_node.dart';
import 'identifier_node.dart';
import 'node.dart';
import 'references_node.dart';

abstract interface class ConstraintNode implements Node {}

class PrimaryKeyConstraintNode implements ConstraintNode {
  final IdentifierNode? name;
  final List<ColumnNode> columns;

  const PrimaryKeyConstraintNode({
    this.name,
    required this.columns,
  });
}

class UniqueConstraintNode implements ConstraintNode {
  final IdentifierNode? name;
  final List<ColumnNode> columns;
  final bool nullsNotDistinct;

  const UniqueConstraintNode({
    this.name,
    required this.columns,
    this.nullsNotDistinct = false,
  });
}

class CheckConnectionNode implements ConstraintNode {
  final IdentifierNode? name;
  final Node expression;

  const CheckConnectionNode({
    this.name,
    required this.expression,
  });
}

class ForeignKeyConstraintNode implements ConstraintNode {
  final IdentifierNode? name;
  final List<ColumnNode> columns;
  final ReferencesNode references;
  final OnModifyForeignAction? onDelete;
  final OnModifyForeignAction? onUpdate;

  const ForeignKeyConstraintNode({
    this.name,
    required this.columns,
    required this.references,
    this.onDelete,
    this.onUpdate,
  });
}
