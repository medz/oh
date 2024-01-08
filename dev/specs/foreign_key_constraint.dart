import 'constraint.dart';
import 'identifier.dart';
import 'references.dart';

class ForeignKeyConstraint implements Constraint {
  final Identifier? name;
  final Iterable<Identifier> columns;
  final References references;
  final OnModifyForeignAction? onDelete;
  final OnModifyForeignAction? onUpdate;

  const ForeignKeyConstraint({
    required this.columns,
    required this.references,
    this.name,
    this.onDelete,
    this.onUpdate,
  });
}
