import 'schemable_identifier_spec.dart';
import 'spec.dart';
import 'table_spec.dart';

class DropIndexSpec implements Spec {
  final SchemableIdentifierSpec name;
  final TableSpec? table;
  final bool ifExists;
  final bool cascade;

  const DropIndexSpec({
    required this.name,
    this.table,
    this.ifExists = false,
    this.cascade = false,
  });
}
