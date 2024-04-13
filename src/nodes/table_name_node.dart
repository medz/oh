import 'identifier_node.dart';
import 'node.dart';

class TableNameNode implements Node {
  final IdentifierNode identifier;
  final IdentifierNode? schema;

  const TableNameNode(this.identifier, {this.schema});

  TableNameNode copyWith({
    IdentifierNode? identifier,
    IdentifierNode? schema,
  }) {
    return TableNameNode(
      identifier ?? this.identifier,
      schema: schema ?? this.schema,
    );
  }
}
