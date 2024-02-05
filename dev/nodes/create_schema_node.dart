import 'identifier_node.dart';
import 'node.dart';

class CreateSchemaNode implements RootNode {
  final IdentifierNode name;
  final bool ifNotExists;

  const CreateSchemaNode({
    required this.name,
    this.ifNotExists = false,
  });
}
