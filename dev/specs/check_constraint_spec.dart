import 'constraint_spec.dart';
import 'identifier_spec.dart';
import 'spec.dart';

class CheckConstraintSpec implements ConstraintSpec {
  final Spec expression;
  final IdentifierSpec? name;

  const CheckConstraintSpec({
    required this.expression,
    this.name,
  });
}
