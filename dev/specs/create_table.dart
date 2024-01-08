import 'spec.dart';
import 'column_def.dart';
import 'constraint.dart';
import 'modifier.dart';
import 'table.dart';

enum OnCommitAction {
  /// The on commit preserve rows action.
  preserveRows,

  /// The on commit delete rows action.
  deleteRows,

  /// The on commit drop action.
  drop,
}

/// `CREATE TABLE` specification.
class CreateTable implements RootSpec {
  /// The table name specification.
  final Table table;

  /// The table column definitions specification.
  final Iterable<ColumnDef> columns;

  /// The table Constraints specification.
  final Iterable<Constraint> constraints;

  /// temporary table
  final bool temporary;

  /// Watcher to create if not exists
  final bool ifNotExists;

  /// The tabel on commit action specification.
  final OnCommitAction? onCommit;

  /// The table as select specification.
  final Spec? asSelectFrom;

  /// The table modifiers specification.
  final Iterable<Modifier> modifiers;

  /// Creates a new `CREATE TABLE` specification.
  const CreateTable({
    required this.table,
    required this.columns,
    this.constraints = const [],
    this.temporary = false,
    this.ifNotExists = false,
    this.onCommit,
    this.asSelectFrom,
    this.modifiers = const [],
  });
}
