import 'identifier_node.dart';
import 'node.dart';

class ColumnNode implements Node {
  final IdentifierNode name;

  const ColumnNode({required this.name});
}
