import '../../driver/database_connection.dart';
import '../../driver/database_support.dart';
import '../../query_builder/statement_builder.dart';
import '../../query_compiler/compiled_query.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/create_schema_spec.dart';

class CreateSchemaBuilder<DB>
    implements StatementBuilder<DB, CreateSchemaSpec, void> {
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

  @override
  CompiledQuery<void> compile() => _executor.compile(toSpec());

  @override
  Future<QueryResult<void>> execute() =>
      _executor.execute(compile(), _identifier);

  @override
  CreateSchemaSpec toSpec() => _spec;
}

extension CreateSchemaBuilder$DatabaseSupportCreateIfNotExists<
    T extends DatabaseSupportCreateIfNotExists> on CreateSchemaBuilder<T> {
  CreateSchemaBuilder<T> ifNotExists([bool value = true]) {
    return CreateSchemaBuilder(
      identifier: _identifier,
      executor: _executor,
      spec: CreateSchemaSpec(
        name: _spec.name,
        ifNotExists: value,
      ),
    );
  }
}
