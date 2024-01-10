import '../../query_builder/statement_builder.dart';
import '../../specs/create_table_spec.dart';
import '../../specs/statement_spec.dart';
import 'table_column_def_builder.dart';

class TableBuilder<DB, T extends StatementSpec, R>
    extends StatementBuilder<DB, T, R> {
  T spec;
  final List<TableColumnDefBuilder<DB, dynamic>> columns = [];

  TableBuilder({
    required super.executor,
    required super.identifier,
    required this.spec,
  });

  @override
  T toSpec() {
    final spec = switch (this.spec) {
      CreateTableSpec spec => spec.copyWith(
          columns: columns.map((e) => e.toSpec()),
        ),
      _ => throw UnsupportedError('Unsupported statement: $this'),
    };

    return spec as T;
  }
}
