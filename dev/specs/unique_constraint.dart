import '../visitors/visitor.dart';
import 'constraint.dart';
import 'identifier.dart';

class UniqueConstraint implements Constraint {
  final Identifier? name;
  final bool nullsNotDistinct;
  final Iterable<Identifier> columns;

  const UniqueConstraint(this.columns,
      {this.name, this.nullsNotDistinct = false});

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitUniqueConstraint(this, context);
  }
}
