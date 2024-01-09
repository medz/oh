import '../specs/check_constraint.dart';
import '../specs/column_def.dart';
import '../specs/create_schema.dart';
import '../specs/create_table.dart';
import '../specs/default_value.dart';
import '../specs/drop_schema.dart';
import '../specs/foreign_key_constraint.dart';
import '../specs/generated.dart';
import '../specs/identifier.dart';
import '../specs/modifier.dart';
import '../specs/primary_key_constraint.dart';
import '../specs/references.dart';
import '../specs/table.dart';
import '../specs/unique_constraint.dart';

abstract interface class SpecVisitor<T> {
  T visitCreateSchema(CreateSchema spec, [T? context]);
  T visitDropSchema(DropSchema spec, [T? context]);
  T visitCreateTable(CreateTable spec, [T? context]);
  T visitDefaultValue(DefaultValue spec, [T? context]);
  T visitColumnDef(ColumnDef spec, [T? context]);
  T visitCheckConstraint(CheckConstraint spec, [T? context]);
  T visitForeignKeyConstraint(ForeignKeyConstraint spec, [T? context]);
  T visitPrimaryKeyConstraint(PrimaryKeyConstraint spec, [T? context]);
  T visitUniqueConstraint(UniqueConstraint spec, [T? context]);
  T visitGenerated(Generated spec, [T? context]);
  T visitIdentifier(Identifier spec, [T? context]);
  T visitModifier(Modifier spec, [T? context]);
  T visitReferences(References spec, [T? context]);
  T visitTable(Table spec, [T? context]);
}
