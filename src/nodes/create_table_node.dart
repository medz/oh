import 'constraint_node.dart';
import 'node.dart';
import 'table_name_node.dart';

class CreateTableNode implements ExecutableNode {
  final TableNameNode name;
  final bool temporary;
  final bool ifNotExists;
  final Iterable<ConstraintNode> constraints;

  const CreateTableNode(
    this.name, {
    this.temporary = false,
    this.ifNotExists = false,
    this.constraints = const [],
  });

  CreateTableNode copyWith({
    bool? temporary,
    bool? ifNotExists,
    Iterable<ConstraintNode>? constraints,
  }) {
    return CreateTableNode(
      name,
      temporary: temporary ?? this.temporary,
      ifNotExists: ifNotExists ?? this.ifNotExists,
      constraints: constraints ?? this.constraints,
    );
  }
}
