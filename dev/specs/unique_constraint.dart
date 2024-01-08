import 'constraint.dart';
import 'identifier.dart';

class UniqueConstraint implements Constraint {
  final Identifier? name;
  final bool nullsNotDistinct;
  final Iterable<Identifier> columns;

  const UniqueConstraint(this.columns,
      {this.name, this.nullsNotDistinct = false});
}
