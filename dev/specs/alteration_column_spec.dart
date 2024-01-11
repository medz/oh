import 'column_spec.dart';
import 'spec.dart';
import 'column_def_spec.dart';

abstract interface class AlterationColumnSpec implements Spec {}

class RenameColumnSpec implements AlterationColumnSpec {
  final ColumnSpec column;
  final ColumnSpec rename;

  const RenameColumnSpec(this.column, this.rename);
}

class AddColumnSpec implements AlterationColumnSpec {
  final ColumnDefSpec column;

  const AddColumnSpec(this.column);
}

class DropColumnSpec implements AlterationColumnSpec {
  final ColumnSpec column;

  const DropColumnSpec(this.column);
}

class AlterColumnSpec implements AlterationColumnSpec {
  final ColumnSpec column;
  final Spec? dataType;
  final Spec? using;
  final Spec? setDefault;
  final bool dropDefault;
  final bool setNotNull;
  final bool dropNotNull;

  const AlterColumnSpec(
    this.column, {
    this.dataType,
    this.setDefault,
    this.dropDefault = false,
    this.setNotNull = false,
    this.dropNotNull = false,
    this.using,
  });
}

class ModifierColumnSpec implements AlterationColumnSpec {
  final ColumnSpec column;

  const ModifierColumnSpec(this.column);
}
