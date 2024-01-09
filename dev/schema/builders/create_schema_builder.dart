import '../../driver/database_connection.dart';
import '../../query_builder/statement_builder.dart';
import '../../query_compiler/compiled_query.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/create_schema_spec.dart';

class CreateSchemaBuilder implements StatementBuilder<CreateSchemaSpec, void> {
  final CreateSchemaSpec _spec;
  final QueryIdentifier _identifier;
  final QueryExecutor _executor;

  const CreateSchemaBuilder({
    required CreateSchemaSpec spec,
    required QueryIdentifier identifier,
    required QueryExecutor executor,
  })  : _spec = spec,
        _identifier = identifier,
        _executor = executor;

  CreateSchemaBuilder cascade([bool value = true]) {
    return CreateSchemaBuilder(
      identifier: _identifier,
      executor: _executor,
      spec: CreateSchemaSpec(
        name: _spec.name,
        ifNotExists: _spec.ifNotExists,
        cascade: value,
      ),
    );
  }

  CreateSchemaBuilder ifNotExists([bool value = true]) {
    return CreateSchemaBuilder(
      identifier: _identifier,
      executor: _executor,
      spec: CreateSchemaSpec(
        name: _spec.name,
        ifNotExists: value,
        cascade: _spec.cascade,
      ),
    );
  }

  @override
  CompiledQuery<void> compile() => _executor.compile(toSpec());

  @override
  Future<QueryResult<void>> execute() =>
      _executor.execute(compile(), _identifier);

  @override
  CreateSchemaSpec toSpec() => _spec;
}
