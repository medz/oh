import '../nodes/create_table_node.dart';

class CreateTable<DB> {
  final CreateTableNode node;

  const CreateTable(this.node);

  /// Set the table as temporary.
  CreateTable<DB> temporary() {
    return CreateTable(node.copyWith(temporary: true));
  }

  /// Set the table to be created only if it does not exist.
  CreateTable<DB> ifNotExists() {
    return CreateTable(node.copyWith(ifNotExists: true));
  }
}
