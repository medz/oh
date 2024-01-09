import '../visitors/visitor.dart';
import 'spec.dart';
import 'check_constraint.dart';
import 'default_value.dart';
import 'generated.dart';
import 'identifier.dart';
import 'modifier.dart';
import 'references.dart';

/// Table column definition specification.
class ColumnDef implements Spec {
  /// The column name specification.
  final Identifier name;

  /// The column type specification.
  final Spec type;

  /// The column references specification.
  final References? references;

  /// the column is primary key.
  final bool primaryKey;

  /// The column is auto increment.
  final bool autoIncrement;

  /// The column is unique.
  final bool unique;

  /// The column is not null.
  final bool notNull;

  /// The column default value specification.
  final DefaultValue? defaultValue;

  /// The column check constraint specification.
  final CheckConstraint? check;

  /// The column generated specification.
  final Generated? generated;

  /// The column is unsigned.
  final bool unsigned;

  /// The column nulls not distinct.
  final bool nullsNotDistinct;

  /// The column modifiers specification.
  final Iterable<Modifier> modifiers;

  /// Creates a column definition specification.
  const ColumnDef({
    required this.name,
    required this.type,
    this.references,
    this.primaryKey = false,
    this.autoIncrement = false,
    this.unique = false,
    this.notNull = false,
    this.defaultValue,
    this.check,
    this.generated,
    this.unsigned = false,
    this.nullsNotDistinct = false,
    this.modifiers = const [],
  });

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) =>
      visitor.visitColumnDef(this, context);
}
