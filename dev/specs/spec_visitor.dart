import 'column_spec.dart';
import 'common_table_expression_name_spec.dart';
import 'common_table_expression_spec.dart';
import 'create_schema_spec.dart';
import 'drop_schema_spec.dart';
import 'identifier_spec.dart';
import 'spec.dart';
import 'table_spec.dart';
import 'with_spec.dart';

abstract class SpecVistor {
  const SpecVistor();

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
      _ => throw Exception('Unknown spec type: $spec'),
    };
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
