import 'constraint_spec.dart';
import 'modifier_spec.dart';
import 'spec.dart';
import 'statement_spec.dart';
import 'table_column_def_spec.dart';
import 'table_spec.dart';

enum OnCommitAction {
  preserveRows,
  deleteRows,
  drop,
}

class CreateTableSpec implements StatementSpec {
  final TableSpec table;
  final Iterable<TableColumnDefSpec> columns;
  final Iterable<ConstraintSpec> constraints;
  final bool temporary;
  final bool ifNotExists;
  final OnCommitAction? onCommit;
  final Iterable<ModifierSpec> modifiers;
  final Spec? as;

  const CreateTableSpec({
    required this.table,
    this.columns = const [],
    this.constraints = const [],
    this.temporary = false,
    this.ifNotExists = false,
    this.onCommit,
    this.modifiers = const [],
    this.as,
  });

  CreateTableSpec copyWith({
    TableSpec? table,
    Iterable<TableColumnDefSpec>? columns,
    Iterable<ConstraintSpec>? constraints,
    bool? temporary,
    bool? ifNotExists,
    OnCommitAction? onCommit,
    Iterable<ModifierSpec>? modifiers,
    Spec? as,
  }) =>
      CreateTableSpec(
        table: table ?? this.table,
        columns: columns ?? this.columns,
        constraints: constraints ?? this.constraints,
        temporary: temporary ?? this.temporary,
        ifNotExists: ifNotExists ?? this.ifNotExists,
        onCommit: onCommit ?? this.onCommit,
        modifiers: modifiers ?? this.modifiers,
        as: as ?? this.as,
      );
}
