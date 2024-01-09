import '../visitors/visitor.dart';
import 'spec.dart';
import 'constraint.dart';
import 'identifier.dart';

class CheckConstraint implements Constraint {
  /// The check constraint expression specification.
  final Spec expression;

  /// The check constraint name specification.
  final Identifier? name;

  /// Creates a check constraint specification.
  const CheckConstraint(this.expression, {this.name});

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitCheckConstraint(this, context);
  }
}
