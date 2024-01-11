import '../query_builder/statement_builder.dart';
import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/create_schema_spec.dart';

class CreateSchemaBuilder<DB>
    extends StatementBuilder<DB, CreateSchemaSpec, void> {
  final QueryExecutor<DB> _executor;
  final QueryIdentifier _identifier;
  final CreateSchemaSpec _spec;

  const CreateSchemaBuilder({
    required super.executor,
    required super.identifier,
    required CreateSchemaSpec spec,
  })  : _executor = executor,
        _identifier = identifier,
        _spec = spec;

  CreateSchemaBuilder<DB> ifNotExists() {
    return CreateSchemaBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: _spec.copyWith(ifNotExists: true),
    );
  }

  @override
  CreateSchemaSpec toSpec() => _spec;
}
