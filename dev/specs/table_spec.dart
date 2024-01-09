import 'identifier_spec.dart';
import 'spec.dart';

class TableSpec implements Spec {
  final IdentifierSpec name;
  final IdentifierSpec? schema;

  const TableSpec({
    required this.name,
    this.schema,
  });
}
