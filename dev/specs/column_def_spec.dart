import 'column_spec.dart';
import 'constraint_spec.dart';
import 'data_type_spec.dart';
import 'default_value_spec.dart';
import 'generated_spec.dart';
import 'modifier_spec.dart';
import 'references_spec.dart';
import 'spec.dart';

class ColumnDefSpec implements Spec {
  final ColumnSpec column;
  final DataTypeSpec dataType;
  final ReferencesSpec? references;
  final bool primaryKey;
  final bool autoIncrement;
  final DefaultValueSpec? defaultValue;
  final CheckConstraintSpec? check;
  final GeneratedSpec? generated;
  final bool unsigned;
  final bool nullsNotDistinct;
  final Iterable<ModifierSpec> modifiers;
  final bool unique;
  final bool notNull;

  const ColumnDefSpec({
    required this.column,
    required this.dataType,
    this.references,
    this.primaryKey = false,
    this.autoIncrement = false,
    this.defaultValue,
    this.check,
    this.generated,
    this.unsigned = false,
    this.nullsNotDistinct = false,
    this.modifiers = const [],
    this.unique = false,
    this.notNull = false,
  });

  ColumnDefSpec copyWith({
    ColumnSpec? column,
    DataTypeSpec? dataType,
    ReferencesSpec? references,
    bool? primaryKey,
    bool? autoIncrement,
    DefaultValueSpec? defaultValue,
    CheckConstraintSpec? check,
    GeneratedSpec? generated,
    bool? unsigned,
    bool? nullsNotDistinct,
    Iterable<ModifierSpec>? modifiers,
    bool? unique,
    bool? notNull,
  }) {
    return ColumnDefSpec(
      column: column ?? this.column,
      dataType: dataType ?? this.dataType,
      references: references ?? this.references,
      primaryKey: primaryKey ?? this.primaryKey,
      autoIncrement: autoIncrement ?? this.autoIncrement,
      defaultValue: defaultValue ?? this.defaultValue,
      check: check ?? this.check,
      generated: generated ?? this.generated,
      unsigned: unsigned ?? this.unsigned,
      nullsNotDistinct: nullsNotDistinct ?? this.nullsNotDistinct,
      modifiers: modifiers ?? this.modifiers,
      unique: unique ?? this.unique,
      notNull: notNull ?? this.notNull,
    );
  }
}
