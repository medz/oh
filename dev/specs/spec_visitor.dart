import 'add_constraint_spec.dart';
import 'add_index_spec.dart';
import 'alter_table_spec.dart';
import 'alteration_column_spec.dart';
import 'column_spec.dart';
import 'common_table_expression_name_spec.dart';
import 'common_table_expression_spec.dart';
import 'constraint_spec.dart';
import 'create_schema_spec.dart';
import 'create_table_spec.dart';
import 'data_type_spec.dart';
import 'default_value_spec.dart';
import 'drop_constraint_spec.dart';
import 'drop_index_spec.dart';
import 'drop_schema_spec.dart';
import 'drop_table_spec.dart';
import 'generated_spec.dart';
import 'identifier_spec.dart';
import 'modifier_spec.dart';
import 'raw_spec.dart';
import 'references_spec.dart';
import 'schemable_identifier_spec.dart';
import 'spec.dart';
import 'table_column_def_spec.dart';
import 'table_spec.dart';
import 'with_spec.dart';

typedef SpecVisitedResult = (String sql, Iterable<Object> params);

abstract class SpecVistor {
  const SpecVistor();

  String get autoIncrementIdentifier => 'AUTO_INCREMENT';
  bool get announcesNewColumnDataType => true;

  (String sql, Iterable<Object> params) visitSpec(Spec spec) {
    return switch (spec) {
      ColumnSpec spec => visitColumnSpec(spec),
      CommonTableExpressionNameSpec spec =>
        visitCommonTableExpressionNameSpec(spec),
      CommonTableExpressionSpec spec => visitCommonTableExpressionSpec(spec),
      CreateSchemaSpec spec => visitCreateSchemaSpec(spec),
      DropSchemaSpec spec => visitDropSchemaSpec(spec),
      IdentifierSpec spec => visitIdentifierSpec(spec),
      TableSpec spec => visitTableSpec(spec),
      WithSpec spec => visitWithSpec(spec),
      CheckConstraintSpec spec => visitCheckConstraintSpec(spec),
      PrimaryKeyConstraintSpec spec => visitPrimaryKeyConstraintSpec(spec),
      UniqueConstraintSpec spec => visitUniqueConstraintSpec(spec),
      ForeignKeyConstraintNode spec => visitForeignKeyConstraintNode(spec),
      ConstraintSpec spec => visitConstraintSpec(spec),
      CreateTableSpec spec => visitCreateTableSpec(spec),
      DataTypeSpec spec => visitDataTypeSpec(spec),
      DefaultValueSpec spec => visitDefaultValueSpec(spec),
      GeneratedSpec spec => visitGeneratedSpec(spec),
      ModifierSpec spec => visitModifierSpec(spec),
      ReferencesSpec spec => visitReferencesSpec(spec),
      TableColumnDefSpec spec => visitTableColumnDefSpec(spec),
      DropTableSpec spec => visitDropTableSpec(spec),
      AddConstraintSpec spec => visitAddConstraintSpec(spec),
      AddIndexSpec spec => visitAddIndexSpec(spec),
      AlterTableSpec spec => visitAlterTableSpec(spec),
      RenameColumnSpec spec => visitRenameColumnSpec(spec),
      AddColumnSpec spec => visitAddColumnSpec(spec),
      DropColumnSpec spec => visitDropColumnSpec(spec),
      AlterColumnSpec spec => visitAlterColumnSpec(spec),
      ModifierColumnSpec spec => visitModifierColumnSpec(spec),
      DropConstraintSpec spec => visitDropConstraintSpec(spec),
      DropIndexSpec spec => visitDropIndexSpec(spec),
      RawSpec spec => visitRawSpec(spec),
      SchemableIdentifierSpec spec => visitSchemableIdentifierSpec(spec),
      _ => throw Exception('Unknown spec type: $spec'),
    };
  }

  SpecVisitedResult visitSchemableIdentifierSpec(SchemableIdentifierSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.schema != null) {
      final schema = visitSpec(spec.schema!);
      sql.write(schema.$1);
      sql.write('.');
      params.addAll(schema.$2);
    }

    final identifier = visitSpec(spec.identifier);
    sql.write(identifier.$1);
    params.addAll(identifier.$2);

    return (sql.toString(), params);
  }

  SpecVisitedResult visitRawSpec(RawSpec spec) {
    final buffer = StringBuffer();
    final params = <Object>[];

    for (final (sql, param) in spec.fragments) {
      buffer.write(sql);
      final result = visitSpec(param);
      buffer.write(result.$1);
      params.addAll(result.$2);
    }

    return (buffer.toString(), params);
  }

  SpecVisitedResult visitDropIndexSpec(DropIndexSpec spec) {
    final sql = StringBuffer('DROP INDEX ');
    if (spec.ifExists) sql.write('IF EXISTS ');

    final name = visitSpec(spec.name);
    sql.write(name.$1);

    if (spec.table != null) {
      final table = visitSpec(spec.table!);
      sql.write(' ON ');
      sql.write(table.$1);
    }

    if (spec.cascade) {
      sql.write(' CASCADE');
    }

    return (sql.toString(), name.$2);
  }

  SpecVisitedResult visitDropConstraintSpec(DropConstraintSpec spec) {
    final sql = StringBuffer('DROP CONSTRAINT ');
    if (spec.ifExists) sql.write('IF EXISTS ');

    final name = visitSpec(spec.name);
    sql.write(name.$1);

    if (spec.modifier != null) {
      sql.write(' ');
      sql.write(switch (spec.modifier!) {
        DropConstraintModifier.cascade => 'CASCADE',
        DropConstraintModifier.restrict => 'RESTRICT',
      });
    }

    return (sql.toString(), name.$2);
  }

  SpecVisitedResult visitForeignKeyConstraintNode(
      ForeignKeyConstraintNode spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.name != null) {
      final name = visitSpec(spec.name!);
      sql.write('CONSTRAINT ');
      sql.write(name.$1);
      sql.write(' ');
      params.addAll(name.$2);
    }

    final columns = spec.columns.map(visitSpec);
    sql.write('FOREIGN KEY (');
    sql.writeAll(columns.map((column) => column.$1), ', ');
    sql.write(')');
    params.addAll(columns.expand((column) => column.$2));

    final references = visitSpec(spec.references);
    sql.write(' ');
    sql.write(references.$1);
    params.addAll(references.$2);

    if (spec.onDelete != null) {
      sql.write(' ON DELETE ');
      sql.write(visitOnModifyForeignAction(spec.onDelete!));
    }

    if (spec.onUpdate != null) {
      sql.write(' ON UPDATE ');
      sql.write(visitOnModifyForeignAction(spec.onUpdate!));
    }

    return (sql.toString(), params);
  }

  SpecVisitedResult visitUniqueConstraintSpec(UniqueConstraintSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.name != null) {
      final name = visitSpec(spec.name!);
      sql.write(name.$1);
      sql.write(' ');
      params.addAll(name.$2);
    }

    sql.write('UNIQUE');
    if (spec.nullsNotDistinct) {
      sql.write(' NULLS NOT DISTINCT');
    }

    final columns = spec.columns.map(visitSpec);
    sql.write(' (');
    sql.writeAll(columns.map((column) => column.$1), ', ');
    sql.write(')');
    params.addAll(columns.expand((column) => column.$2));

    return (sql.toString(), params);
  }

  SpecVisitedResult visitPrimaryKeyConstraintSpec(
      PrimaryKeyConstraintSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.name != null) {
      final name = visitSpec(spec.name!);
      sql.write(name.$1);
      sql.write(' ');
      params.addAll(name.$2);
    }

    sql.write('PRIMARY KEY (');
    final columns = spec.columns.map(visitSpec);
    sql.writeAll(columns.map((column) => column.$1), ', ');
    sql.write(')');
    params.addAll(columns.expand((column) => column.$2));

    return (sql.toString(), params);
  }

  SpecVisitedResult visitModifierColumnSpec(ModifierColumnSpec spec) {
    final sql = StringBuffer('MODIFY COLUMN ');
    final result = visitSpec(spec.column);
    sql.write(result.$1);

    return (sql.toString(), result.$2);
  }

  SpecVisitedResult visitAlterColumnSpec(AlterColumnSpec spec) {
    final sql = StringBuffer('ALTER COLUMN ');
    final params = <Object>[];

    final column = visitSpec(spec.column);
    sql.write(column.$1);
    params.addAll(column.$2);

    if (spec.dataType != null) {
      if (announcesNewColumnDataType) {
        sql.write(' TYPE');
      }

      final dataType = visitSpec(spec.dataType!);
      sql.write(' ');
      sql.write(dataType.$1);
      params.addAll(dataType.$2);

      if (spec.using != null) {
        sql.write(' USING ');
        final using = visitSpec(spec.using!);
        sql.write(using.$1);
        params.addAll(using.$2);
      }
    }

    if (spec.setDefault != null) {
      final setDefault = visitSpec(spec.setDefault!);
      sql.write(' SET DEFAULT ');
      sql.write(setDefault.$1);
      params.addAll(setDefault.$2);
    }

    if (spec.dropDefault) sql.write(' DROP DEFAULT');
    if (spec.setNotNull) sql.write(' SET NOT NULL');
    if (spec.dropNotNull) sql.write(' DROP NOT NULL');

    return (sql.toString(), params);
  }

  SpecVisitedResult visitDropColumnSpec(DropColumnSpec spec) {
    final sql = StringBuffer('DROP COLUMN ');
    final result = visitSpec(spec.column);
    sql.write(result.$1);

    return (sql.toString(), result.$2);
  }

  SpecVisitedResult visitAddColumnSpec(AddColumnSpec spec) {
    final sql = StringBuffer('ADD COLUMN ');
    final result = visitSpec(spec.column);
    sql.write(result.$1);

    return (sql.toString(), result.$2);
  }

  SpecVisitedResult visitRenameColumnSpec(RenameColumnSpec spec) {
    final sql = StringBuffer('RENAME COLUMN ');
    final params = <Object>[];

    final column = visitSpec(spec.column);
    sql.write(column.$1);
    params.addAll(column.$2);

    sql.write(' TO ');
    final rename = visitSpec(spec.rename);
    sql.write(rename.$1);
    params.addAll(rename.$2);

    return (sql.toString(), params);
  }

  SpecVisitedResult visitAlterTableSpec(AlterTableSpec spec) {
    final sql = StringBuffer('ALTER TABLE ');
    final params = <Object>[];

    final table = visitSpec(spec.table);
    sql.write(table.$1);
    params.addAll(table.$2);

    if (spec.renameTo != null) {
      final renameTo = visitSpec(spec.renameTo!);
      sql.write(' RENAME TO ');
      sql.write(renameTo.$1);
      params.addAll(renameTo.$2);
    }

    if (spec.setSchema != null) {
      final setSchema = visitSpec(spec.setSchema!);
      sql.write(' SET SCHEMA ');
      sql.write(setSchema.$1);
      params.addAll(setSchema.$2);
    }

    if (spec.addConstraint != null) {
      final addConstraint = visitSpec(spec.addConstraint!);
      sql.write(' ');
      sql.write(addConstraint.$1);
      params.addAll(addConstraint.$2);
    }

    if (spec.dropConstraint != null) {
      final dropConstraint = visitSpec(spec.dropConstraint!);
      sql.write(' ');
      sql.write(dropConstraint.$1);
      params.addAll(dropConstraint.$2);
    }

    if (spec.columns.isNotEmpty) {
      final columns = spec.columns.map(visitSpec);
      sql.write(' ');
      sql.writeAll(columns.map((column) => column.$1), ', ');
      params.addAll(columns.expand((column) => column.$2));
    }

    if (spec.addIndex != null) {
      final addIndex = visitSpec(spec.addIndex!);
      sql.write(' ');
      sql.write(addIndex.$1);
      params.addAll(addIndex.$2);
    }

    if (spec.dropIndex != null) {
      final dropIndex = visitSpec(spec.dropIndex!);
      sql.write(' ');
      sql.write(dropIndex.$1);
      params.addAll(dropIndex.$2);
    }

    return (sql.toString(), params);
  }

  SpecVisitedResult visitAddIndexSpec(AddIndexSpec spec) {
    final sql = StringBuffer('ADD ');
    final params = <Object>[];

    if (spec.unique) sql.write('UNIQUE ');

    sql.write('INDEX ');
    final name = visitSpec(spec.name);
    sql.write(name.$1);
    params.addAll(name.$2);

    if (spec.columns.isNotEmpty) {
      final columns = spec.columns.map(visitSpec);
      sql.write(' (');
      sql.writeAll(columns.map((column) => column.$1), ', ');
      sql.write(')');
      params.addAll(columns.expand((column) => column.$2));
    }

    if (spec.using != null) {
      final using = visitSpec(spec.using!);
      sql.write(' USING ');
      sql.write(using.$1);
      params.addAll(using.$2);
    }

    return (sql.toString(), params);
  }

  SpecVisitedResult visitAddConstraintSpec(AddConstraintSpec spec) {
    final sql = StringBuffer('ADD ');
    final result = visitSpec(spec.constraint);
    sql.write(result.$1);

    return (sql.toString(), result.$2);
  }

  (String, Iterable<Object>) visitDropTableSpec(DropTableSpec spec) {
    final sql = StringBuffer('DROP TABLE ');
    if (spec.ifExists) {
      sql.write('IF EXISTS ');
    }

    final table = visitSpec(spec.table);
    sql.write(table.$1);

    if (spec.cascade) {
      sql.write(' CASCADE');
    }

    return (sql.toString(), table.$2);
  }

  (String, Iterable<Object>) visitTableColumnDefSpec(TableColumnDefSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    final column = visitSpec(spec.column);
    sql.write(column.$1);
    sql.write(' ');
    params.addAll(column.$2);

    final dataType = visitSpec(spec.dataType);
    sql.write(dataType.$1);
    params.addAll(dataType.$2);

    if (spec.unsigned) {
      sql.write(' UNSIGNED');
    }

    final before = spec.modifiers
        .where((element) => element.location == ModifierLocation.before)
        .map(visitSpec);
    if (before.isNotEmpty) {
      sql.write(' ');
      sql.writeAll(before.map((e) => e.$1), ' ');
      params.addAll(before.expand((e) => e.$2));
    }

    if (spec.generated != null) {
      final generated = visitSpec(spec.generated!);
      sql.write(' ');
      sql.write(generated.$1);
      params.addAll(generated.$2);
    }

    if (spec.defaultValue != null) {
      final defaultValue = visitSpec(spec.defaultValue!);
      sql.write(' ');
      sql.write(defaultValue.$1);
      params.addAll(defaultValue.$2);
    }

    if (spec.notNull) sql.write(' NOT NULL');
    if (spec.unique) sql.write(' UNIQUE');
    if (spec.nullsNotDistinct) sql.write(' NULLS NOT DISTINCT');
    if (spec.primaryKey) sql.write(' PRIMARY KEY');
    if (spec.autoIncrement) {
      sql.write(' ');
      sql.write(autoIncrementIdentifier);
    }
    if (spec.references != null) {
      sql.write(' ');
      final references = visitSpec(spec.references!);
      sql.write(references.$1);
      params.addAll(references.$2);
    }
    if (spec.check != null) {
      sql.write(' ');
      final check = visitSpec(spec.check!);
      sql.write(check.$1);
      params.addAll(check.$2);
    }

    final after = spec.modifiers
        .where((element) => element.location == ModifierLocation.after)
        .map(visitSpec);
    if (after.isNotEmpty) {
      sql.write(' ');
      sql.writeAll(after.map((e) => e.$1), ' ');
      params.addAll(after.expand((e) => e.$2));
    }

    return (sql.toString(), params);
  }

  String visitOnModifyForeignAction(OnModifyForeignAction action) {
    return switch (action) {
      OnModifyForeignAction.noAction => 'NO ACTION',
      OnModifyForeignAction.restrict => 'RESTRICT',
      OnModifyForeignAction.cascade => 'CASCADE',
      OnModifyForeignAction.setDefault => 'SET DEFAULT',
      OnModifyForeignAction.setNull => 'SET NULL',
    };
  }

  (String, Iterable<Object>) visitReferencesSpec(ReferencesSpec spec) {
    final sql = StringBuffer('REFERENCES ');
    final params = <Object>[];

    final table = visitSpec(spec.table);
    sql.write(table.$1);
    sql.write(' ');
    params.addAll(table.$2);

    final columns = spec.columns.map(visitSpec);
    sql.write('(');
    sql.writeAll(columns.map((column) => column.$1), ', ');
    sql.write(')');
    params.addAll(columns.expand((column) => column.$2));

    if (spec.onDelete != null) {
      sql.write(' ON DELETE ');
      sql.write(visitOnModifyForeignAction(spec.onDelete!));
    }
    if (spec.onUpdate != null) {
      sql.write(' ON UPDATE ');
      sql.write(visitOnModifyForeignAction(spec.onUpdate!));
    }

    return (sql.toString(), params);
  }

  (String, Iterable<Object>) visitModifierSpec(ModifierSpec spec) {
    return visitSpec(spec.value);
  }

  (String, Iterable<Object>) visitGeneratedSpec(GeneratedSpec spec) {
    final sql = StringBuffer('GENERATED ');
    final params = <Object>[];

    if (spec.always) sql.write('ALWAYS ');
    if (spec.byDefault) sql.write('BY DEFAULT ');

    sql.write('AS ');

    if (spec.identity) sql.write('IDENTITY ');
    if (spec.expression != null) {
      final expression = visitSpec(spec.expression!);
      sql.write('(');
      sql.write(expression.$1);
      sql.write(')');
      params.addAll(expression.$2);
    }
    if (spec.stored) {
      sql.write(' STORED');
    }

    return (sql.toString(), params);
  }

  (String, Iterable<Object>) visitDefaultValueSpec(DefaultValueSpec spec) {
    final sql = StringBuffer('DEFAULT ');
    final result = visitSpec(spec.value);
    sql.write(result.$1);

    return (sql.toString(), result.$2);
  }

  (String, Iterable<Object>) visitDataTypeSpec(DataTypeSpec spec) {
    return (spec.name, const []);
  }

  (String, Iterable<Object>) visitCreateTableSpec(CreateTableSpec spec) {
    final sql = StringBuffer('CREATE ');
    final params = <Object>[];

    final beforeModifiers = spec.modifiers
        .where((element) => element.location == ModifierLocation.before)
        .map(visitSpec);
    if (beforeModifiers.isNotEmpty) {
      sql.writeAll(beforeModifiers.map((e) => e.$1), ' ');
      sql.write(" ");
      params.addAll(beforeModifiers.expand((e) => e.$2));
    }

    if (spec.temporary) {
      sql.write('TEMPORARY ');
    }

    sql.write('TABLE ');
    if (spec.ifNotExists) {
      sql.write('IF NOT EXISTS ');
    }

    final table = visitSpec(spec.table);
    sql.write(table.$1);
    sql.write(' ');
    params.addAll(table.$2);

    if (spec.as is Spec) {
      sql.write('AS ');
      final as = visitSpec(spec.as!);
      sql.write(as.$1);

      return (sql.toString(), [...params, ...as.$2]);
    }

    final columns = spec.columns.map(visitSpec);
    sql.write('(');
    sql.writeAll(columns.map((column) => column.$1), ', ');
    sql.write(')');
    params.addAll(columns.expand((column) => column.$2));

    if (spec.onCommit != null) {
      sql.write(' ON COMMIT ');
      sql.write(switch (spec.onCommit!) {
        OnCommitAction.deleteRows => 'DELETE ROWS',
        OnCommitAction.preserveRows => 'PRESERVE ROWS',
        OnCommitAction.drop => 'DROP',
      });
    }

    final afterModifiers = spec.modifiers
        .where((element) => element.location == ModifierLocation.after)
        .map((e) => visitSpec(e.value));
    if (afterModifiers.isNotEmpty) {
      sql.write(" ");
      sql.writeAll(afterModifiers.map((e) => e.$1), ' ');
      params.addAll(afterModifiers.expand((e) => e.$2));
    }

    return (sql.toString(), params);
  }

  (String sql, Iterable<Object> params) visitConstraintSpec(
      ConstraintSpec spec) {
    return switch (spec) {
      CheckConstraintSpec spec => visitCheckConstraintSpec(spec),
      _ => throw Exception('Unknown constraint spec type: $spec'),
    };
  }

  (String sql, Iterable<Object> params) visitCheckConstraintSpec(
      CheckConstraintSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.name != null) {
      final name = visitSpec(spec.name!);
      sql.write(name.$1);
      sql.write(' ');
      params.addAll(name.$2);
    }

    sql.write('CHECK (');
    final expression = visitSpec(spec.expression);
    sql.write(expression.$1);
    sql.write(')');

    return (sql.toString(), [...params, ...expression.$2]);
  }

  (String sql, Iterable<Object> params) visitWithSpec(WithSpec spec) {
    final sql = StringBuffer('WITH ');
    final params = <Object>[];

    if (spec.recursive) {
      sql.write('RECURSIVE ');
    }

    final results = spec.expressions.map(visitSpec);
    sql.writeAll(results.map((result) => result.$1), ', ');

    return (
      sql.toString(),
      [...params, ...results.expand((result) => result.$2)],
    );
  }

  (String sql, Iterable<Object> params) visitTableSpec(TableSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    if (spec.schema != null) {
      final schema = visitSpec(spec.schema!);
      sql.write(schema.$1);
      sql.write('.');
      params.addAll(schema.$2);
    }

    final name = visitSpec(spec.name);
    sql.write(name.$1);

    return (sql.toString(), [...params, ...name.$2]);
  }

  (String sql, Iterable<Object> params) visitIdentifierSpec(
      IdentifierSpec spec) {
    assert(spec.name.isNotEmpty, 'Identifier name cannot be empty');

    return ('"${spec.name}"', const []);
  }

  (String sql, Iterable<Object> params) visitDropSchemaSpec(
      DropSchemaSpec spec) {
    final sql = StringBuffer('DROP SCHEMA ');
    if (spec.ifExists) {
      sql.write('IF EXISTS ');
    }

    final name = visitSpec(spec.name);
    sql.write(name.$1);

    if (spec.cascade) {
      sql.write(' CASCADE');
    }

    return (sql.toString(), name.$2);
  }

  (String sql, Iterable<Object> params) visitCreateSchemaSpec(
      CreateSchemaSpec spec) {
    final sql = StringBuffer('CREATE SCHEMA ');
    if (spec.ifNotExists) {
      sql.write('IF NOT EXISTS ');
    }

    final name = visitSpec(spec.name);
    sql.write(name.$1);

    return (sql.toString(), name.$2);
  }

  (String sql, Iterable<Object> params) visitCommonTableExpressionSpec(
      CommonTableExpressionSpec spec) {
    final sql = StringBuffer();
    final params = <Object>[];

    final result = visitSpec(spec.name);
    sql.write(result.$1);
    sql.write(' AS ');
    params.addAll(result.$2);

    if (spec.materialized != null) {
      if (spec.materialized == true) {
        sql.write('NOT ');
      }

      sql.write('MATERIALIZED ');
    }

    final expression = visitSpec(spec.expression);
    sql.write(expression.$1);

    return (sql.toString(), [...params, ...expression.$2]);
  }

  (String sql, Iterable<Object> params) visitCommonTableExpressionNameSpec(
      CommonTableExpressionNameSpec spec) {
    final table = visitSpec(spec.table);
    if (spec.columns.isEmpty) {
      return table;
    }

    final sql = StringBuffer(table.$1);
    final results = spec.columns.map(visitSpec);

    sql.write('(');
    sql.writeAll(results.map((result) => result.$1), ', ');
    sql.write(')');

    return (
      sql.toString(),
      [...table.$2, ...results.expand((result) => result.$2)],
    );
  }

  (String sql, Iterable<Object> params) visitColumnSpec(ColumnSpec spec) =>
      visitSpec(spec.name);
}
