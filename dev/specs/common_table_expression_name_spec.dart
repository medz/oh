import 'column_spec.dart';
import 'spec.dart';
import 'table_spec.dart';

class CommonTableExpressionNameSpec implements Spec {
  final TableSpec table;
  final Iterable<ColumnSpec> columns;

  const CommonTableExpressionNameSpec({
    required this.table,
    required this.columns,
  });
}
