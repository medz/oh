import 'identifier_spec.dart';
import 'spec.dart';

class ColumnSpec implements Spec {
  final IdentifierSpec name;

  const ColumnSpec({
    required this.name,
  });
}
