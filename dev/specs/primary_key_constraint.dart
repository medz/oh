import '../visitors/visitor.dart';
import 'constraint.dart';
import 'identifier.dart';

class PrimaryKeyConstraint implements Constraint {
  final Identifier? name;
  final Iterable<Identifier> columns;

  const PrimaryKeyConstraint(this.columns, {this.name});

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitPrimaryKeyConstraint(this, context);
  }
}
