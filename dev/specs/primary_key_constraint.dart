import 'constraint.dart';
import 'identifier.dart';

class PrimaryKeyConstraint implements Constraint {
  final Identifier? name;
  final Iterable<Identifier> columns;

  const PrimaryKeyConstraint(this.columns, {this.name});
}
