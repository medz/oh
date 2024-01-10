import '../../driver/database_connection.dart';
import '../../query_builder/statement_builder.dart';
import '../../query_compiler/compiled_query.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/drop_schema_spec.dart';

class DropSchemaBuilder<DB>
    implements StatementBuilder<DB, DropSchemaSpec, void> {
  final DropSchemaSpec _spec;
  final QueryIdentifier _identifier;
  final QueryExecutor _executor;

  const DropSchemaBuilder({
    required DropSchemaSpec spec,
    required QueryIdentifier identifier,
    required QueryExecutor executor,
  })  : _spec = spec,
        _identifier = identifier,
        _executor = executor;

  DropSchemaBuilder<DB> ifExists([bool value = true]) {
    return DropSchemaBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: DropSchemaSpec(
        name: _spec.name,
        ifExists: value,
        cascade: _spec.cascade,
      ),
    );
  }

  DropSchemaBuilder<DB> cascade([bool value = true]) {
    return DropSchemaBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: DropSchemaSpec(
        name: _spec.name,
        ifExists: _spec.ifExists,
        cascade: value,
      ),
    );
  }

  @override
  CompiledQuery<void> compile() {
    return _executor.compile(toSpec());
  }

  @override
  Future<QueryResult<void>> execute() {
    return _executor.execute(compile(), _identifier);
  }

  @override
  DropSchemaSpec toSpec() => _spec;
}
