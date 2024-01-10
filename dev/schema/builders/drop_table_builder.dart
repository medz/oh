import '../../query_builder/statement_builder.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/drop_table_spec.dart';

class DropTableBuilder<DB> extends StatementBuilder<DB, DropTableSpec, void> {
  final DropTableSpec _spec;
  final QueryExecutor<DB> _executor;
  final QueryIdentifier _identifier;

  const DropTableBuilder({
    required super.executor,
    required super.identifier,
    required DropTableSpec spec,
  })  : _spec = spec,
        _executor = executor,
        _identifier = identifier;

  @override
  DropTableSpec toSpec() => _spec;

  DropTableBuilder<DB> ifExists() => copyWith(ifExists: true);
  DropTableBuilder<DB> cascade() => copyWith(cascade: true);
}

extension<T> on DropTableBuilder<T> {
  DropTableBuilder<T> copyWith({
    bool? ifExists,
    bool? cascade,
  }) {
    return DropTableBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: _spec.copyWith(ifExists: ifExists, cascade: cascade),
    );
  }
}
