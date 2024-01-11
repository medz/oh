import '../query_builder/statement_builder.dart';
import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/column_def_spec.dart';
import '../specs/column_spec.dart';
import '../specs/create_table_spec.dart';
import '../specs/data_type_spec.dart';
import '../specs/identifier_spec.dart';
import 'column_def_builder.dart';

class CreateTableBuilder<DB>
    extends StatementBuilder<DB, CreateTableSpec, void> {
  final QueryExecutor<DB> _executor;
  final QueryIdentifier _identifier;

  const CreateTableBuilder({
    required super.executor,
    required super.identifier,
    required super.spec,
  })  : _executor = executor,
        _identifier = identifier;

  /// Creates a new create table builder with new column by name and native data
  /// type.
  CreateTableBuilder<DB> columnWithNativeType<T>(
    String name,
    String type,
    ColumnDefBuilder<DB, T> Function(ColumnDefBuilder<DB, T> column) closure,
  ) {
    final column = ColumnDefSpec(
      column: ColumnSpec(name: IdentifierSpec(name)),
      dataType: DataTypeSpec(type),
    );
    final builder = ColumnDefBuilder<DB, T>(spec: column);
    final result = closure(builder);
    final spec = toSpec();

    return CreateTableBuilder<DB>(
      executor: _executor,
      identifier: _identifier,
      spec: spec.copyWith(
        columns: [
          ...spec.columns,
          result.toSpec(),
        ],
      ),
    );
  }
}
