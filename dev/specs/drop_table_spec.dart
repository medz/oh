import 'statement_spec.dart';
import 'table_spec.dart';

class DropTableSpec implements StatementSpec {
  final TableSpec table;
  final bool ifExists;
  final bool cascade;

  const DropTableSpec(
    this.table, {
    this.ifExists = false,
    this.cascade = false,
  });

  DropTableSpec copyWith({
    bool? ifExists,
    bool? cascade,
  }) {
    return DropTableSpec(
      table,
      ifExists: ifExists ?? this.ifExists,
      cascade: cascade ?? this.cascade,
    );
  }
}
