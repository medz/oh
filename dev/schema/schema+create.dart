// ignore_for_file: file_names

import '../executor/executable.dart';
import '../nodes/create_schema_node.dart';
import '../nodes/identifier_node.dart';
import 'create_schema.dart';
import 'schema.dart';

extension Schema$Create<DB extends SupportSchema> on Schema<DB> {
  /// Creates a new schema.
  Executable<CreateSchemaNode, void> create(
      [void Function(CreateSchema schema)? builder]) {
    final schema = CreateSchema(
      node: CreateSchemaNode(name: IdentifierNode(name)),
    );
    builder?.call(schema);

    return Executable(
      executor: executor,
      mapper: (dynamic _) {},
      node: schema.node,
    );
  }
}
