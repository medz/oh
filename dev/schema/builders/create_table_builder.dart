import '../../query_builder/statement_builder.dart';
import '../../specs/column_spec.dart';
import '../../specs/create_table_spec.dart';
import '../../specs/identifier_spec.dart';
import '../../specs/spec.dart';
import '../../specs/table_column_def_spec.dart';
import 'table_column_def_builder.dart';

class CreateTableBuilder<DB>
    extends StatementBuilder<DB, CreateTableSpec, void> {
  CreateTableSpec _spec;

  final List<TableColumnDefBuilder<DB, dynamic>> _columns = [];

  CreateTableBuilder({
    required super.executor,
    required super.identifier,
    required CreateTableSpec spec,
  }) : _spec = spec;

  @override
  CreateTableSpec toSpec() {
    return _spec.copyWith(
      columns: _columns.map((e) => e.toSpec()),
    );
  }

  TableColumnDefBuilder<DB, T> column<T>(String name, Spec dataType) {
    final def = TableColumnDefSpec(
      column: ColumnSpec(name: IdentifierSpec(name)),
      dataType: dataType,
    );
    final builder = TableColumnDefBuilder<DB, T>(def);

    _columns.add(builder);
    return builder;
  }
}

extension CreateTableBuilder$DatabaseSupportCreateIfNotExists<DB>
    on CreateTableBuilder<DB> {
  bool get ifNotExists => _spec.ifNotExists;

  set ifNotExists(bool value) => _spec = _spec.copyWith(ifNotExists: value);
}
