import 'column_node.dart';
import 'constraint_node.dart';
import 'default_value_node.dart';
import 'generated_node.dart';
import 'modifier.dart';
import 'node.dart';
import 'references_node.dart';

class ColumnDefinitionNode implements Node {
  final ColumnNode column;
  final Node dataType;
  final ReferencesNode? references;
  final bool primaryKey;
  final bool unique;
  final bool autoIncrement;
  final bool notNull;
  final bool unsigned;
  final bool nullsNotDistinct;
  final DefaultValueNode? defaultTo;
  final CheckConnectionNode? check;
  final GeneratedNode? generated;
  final List<Modifier> modifiers;

  const ColumnDefinitionNode({
    required this.column,
    required this.dataType,
    this.references,
    this.primaryKey = false,
    this.unique = false,
    this.autoIncrement = false,
    this.notNull = false,
    this.unsigned = false,
    this.nullsNotDistinct = false,
    this.defaultTo,
    this.check,
    this.generated,
    this.modifiers = const [],
  });
}
