import 'add_constraint_spec.dart';
import 'add_index_spec.dart';
import 'alteration_column_spec.dart';
import 'drop_constraint_spec.dart';
import 'drop_index_spec.dart';
import 'identifier_spec.dart';
import 'statement_spec.dart';
import 'table_spec.dart';

class AlterTableSpec implements StatementSpec {
  final TableSpec table;
  final TableSpec? renameTo;
  final IdentifierSpec? setSchema;
  final Iterable<AlterationColumnSpec> columns;
  final AddConstraintSpec? addConstraint;
  final DropConstraintSpec? dropConstraint;
  final AddIndexSpec? addIndex;
  final DropIndexSpec? dropIndex;

  const AlterTableSpec({
    required this.table,
    this.renameTo,
    this.setSchema,
    required this.columns,
    this.addConstraint,
    this.dropConstraint,
    this.addIndex,
    this.dropIndex,
  });

  AlterTableSpec copyWith({
    TableSpec? table,
    TableSpec? renameTo,
    IdentifierSpec? setSchema,
    Iterable<AlterationColumnSpec>? columns,
    AddConstraintSpec? addConstraint,
    DropConstraintSpec? dropConstraint,
    AddIndexSpec? addIndex,
    DropIndexSpec? dropIndex,
  }) {
    return AlterTableSpec(
      table: table ?? this.table,
      renameTo: renameTo ?? this.renameTo,
      setSchema: setSchema ?? this.setSchema,
      columns: columns ?? this.columns,
      addConstraint: addConstraint ?? this.addConstraint,
      dropConstraint: dropConstraint ?? this.dropConstraint,
      addIndex: addIndex ?? this.addIndex,
      dropIndex: dropIndex ?? this.dropIndex,
    );
  }
}
