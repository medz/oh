import 'identifier_spec.dart';
import 'spec.dart';

enum DropConstraintModifier {
  restrict,
  cascade,
}

class DropConstraintSpec implements Spec {
  final IdentifierSpec name;
  final bool ifExists;
  final DropConstraintModifier? modifier;

  const DropConstraintSpec({
    required this.name,
    this.ifExists = false,
    this.modifier,
  });
}
