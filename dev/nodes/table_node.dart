import 'identifier_node.dart';
import 'node.dart';

class TableNode implements Node {
  final IdentifierNode name;
  final IdentifierNode? schema;

  const TableNode({
    required this.name,
    this.schema,
  });
}
