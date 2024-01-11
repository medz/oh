import 'column_spec.dart';
import 'identifier_spec.dart';
import 'references_spec.dart';
import 'spec.dart';

abstract base class ConstraintSpec implements Spec {}

final class CheckConstraintSpec implements ConstraintSpec {
  final Spec expression;
  final IdentifierSpec? name;

  const CheckConstraintSpec({
    required this.expression,
    this.name,
  });
}

final class PrimaryKeyConstraintSpec implements ConstraintSpec {
  final Iterable<ColumnSpec> columns;
  final IdentifierSpec? name;

  const PrimaryKeyConstraintSpec({
    required this.columns,
    this.name,
  });
}

final class UniqueConstraintSpec implements ConstraintSpec {
  final Iterable<ColumnSpec> columns;
  final IdentifierSpec? name;
  final bool nullsNotDistinct;

  const UniqueConstraintSpec({
    required this.columns,
    this.name,
    this.nullsNotDistinct = false,
  });
}

final class ForeignKeyConstraintNode implements ConstraintSpec {
  final Iterable<ColumnSpec> columns;
  final ReferencesSpec references;
  final OnModifyForeignAction? onUpdate;
  final OnModifyForeignAction? onDelete;
  final IdentifierSpec? name;

  const ForeignKeyConstraintNode({
    required this.columns,
    required this.references,
    this.onUpdate,
    this.onDelete,
    this.name,
  });
}
