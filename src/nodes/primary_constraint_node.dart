import 'constraint_node.dart';
import 'identifier_node.dart';

class PrimaryConstraintNode implements ConstraintNode {
  final IdentifierNode? name;
  final Iterable<IdentifierNode> columns;

  const PrimaryConstraintNode({
    this.name,
    this.columns = const [],
  });

  PrimaryConstraintNode copyWith({
    IdentifierNode? name,
    Iterable<IdentifierNode>? columns,
  }) {
    return PrimaryConstraintNode(
      name: name ?? this.name,
      columns: columns ?? this.columns,
    );
  }
}

extension type Demo<T>(T value) {}
