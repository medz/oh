// ignore_for_file: file_names

import '../nodes/create_table_node.dart';
import '../nodes/identifier_node.dart';
import '../nodes/table_name_node.dart';
import '../oh.dart';
import 'create_table.dart';

extension Oh$CreateTable<DB> on Oh<DB> {
  CreateTable<DB> createTable(String name, {String? schema}) {
    final identifierNode = IdentifierNode(name);
    final schemaIdentifierNode = schema != null ? IdentifierNode(schema) : null;
    final tableNameNode = TableNameNode(
      identifierNode,
      schema: schemaIdentifierNode,
    );
    final createTableNode = CreateTableNode(tableNameNode);

    return CreateTable(createTableNode);
  }
}
