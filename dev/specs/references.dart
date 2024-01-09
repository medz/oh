import '../visitors/visitor.dart';
import 'spec.dart';
import 'identifier.dart';
import 'table.dart';

/// Foreign key on modify action.
enum OnModifyForeignAction {
  /// No action.
  noAction,

  /// Restrict.
  restrict,

  /// Cascade.
  cascade,

  /// Set null.
  setNull,

  /// Set default.
  setDefault,
}

class References implements Spec {
  /// The table name specification.
  final Table table;

  /// The column names specification.
  final Iterable<Identifier> columns;

  /// The on delete action.
  final OnModifyForeignAction? onDelete;

  /// The on update action.
  final OnModifyForeignAction? onUpdate;

  /// Creates a references specification.
  const References({
    required this.table,
    required this.columns,
    this.onDelete,
    this.onUpdate,
  });

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitReferences(this, context);
  }
}
