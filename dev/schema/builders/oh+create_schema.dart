// ignore_for_file: file_names

import '../../driver/database_connection.dart';
import '../../driver/database_support.dart';
import '../../oh.dart';
import '../../query_compiler/compiled_query.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/create_schema_spec.dart';
import '../../specs/identifier_spec.dart';
import 'create_schema_builder.dart';

extension Oh$CreateSchema<T extends DatabaseSupportSchema> on Oh<T> {
  CreateSchemaBuilder createSchema(
    String name, {
    bool ifNotExists = false,
    bool cascade = false,
  }) {
    assert(name.isNotEmpty, 'schema name cannot be empty');

    return _CreateSchemaBuilder(
      identifier: QueryIdentifier(),
      executor: this,
      spec: CreateSchemaSpec(
        name: IdentifierSpec(name),
        ifNotExists: ifNotExists,
        cascade: cascade,
      ),
    );
  }
}

class _CreateSchemaBuilder implements CreateSchemaBuilder {
  final CreateSchemaSpec spec;
  final QueryIdentifier identifier;
  final QueryExecutor executor;

  const _CreateSchemaBuilder({
    required this.spec,
    required this.identifier,
    required this.executor,
  });

  @override
  CreateSchemaBuilder cascade([bool value = true]) {
    return _CreateSchemaBuilder(
      identifier: identifier,
      executor: executor,
      spec: CreateSchemaSpec(
        name: spec.name,
        ifNotExists: spec.ifNotExists,
        cascade: value,
      ),
    );
  }

  @override
  CreateSchemaBuilder ifNotExists([bool value = true]) {
    return _CreateSchemaBuilder(
      identifier: identifier,
      executor: executor,
      spec: CreateSchemaSpec(
        name: spec.name,
        ifNotExists: value,
        cascade: spec.cascade,
      ),
    );
  }

  @override
  CreateSchemaSpec toSpec() => spec;

  @override
  CompiledQuery<void> compile() => executor.compile(spec, identifier);

  @override
  Future<QueryResult<void>> execute() =>
      executor.execute(compile(), identifier);
}
