import '../nodes/create_schema_node.dart';
import '../nodes/node_source.dart';

class CreateSchema implements NodeSource<CreateSchemaNode> {
  CreateSchema({required CreateSchemaNode node}) : _node = node;

  CreateSchemaNode _node;

  @override
  CreateSchemaNode get node => _node;

  set ifNotExists(bool ifNotExists) {
    _node = _node.copyWith(ifNotExists: ifNotExists);
  }
}

extension on CreateSchemaNode {
  CreateSchemaNode copyWith({bool? ifNotExists}) {
    return CreateSchemaNode(
      name: name,
      ifNotExists: ifNotExists ?? this.ifNotExists,
    );
  }
}
