// ignore_for_file: file_names

import '../../driver/database_connection.dart';
import '../../driver/database_support.dart';
import '../../oh.dart';
import '../../query_compiler/compiled_query.dart';
import '../../query_executor/query_executor.dart';
import '../../query_executor/query_identifier.dart';
import '../../specs/drop_schema_spec.dart';
import '../../specs/identifier_spec.dart';
import 'drop_schema_builder.dart';

extension Oh$DropSchema<T extends DatabaseSupportSchema> on Oh<T> {
  DropSchemaBuilder dropSchema(
    String name, {
    bool ifExists = false,
    bool cascade = false,
  }) {
    assert(name.isNotEmpty, 'Schema name cannot be empty');

    return _DropSchemaBuilder(
      identifier: QueryIdentifier(),
      executor: this,
      spec: DropSchemaSpec(
        name: IdentifierSpec(name),
        ifExists: ifExists,
        cascade: cascade,
      ),
    );
  }
}

class _DropSchemaBuilder implements DropSchemaBuilder {
  final DropSchemaSpec spec;
  final QueryIdentifier identifier;
  final QueryExecutor executor;

  const _DropSchemaBuilder({
    required this.spec,
    required this.identifier,
    required this.executor,
  });

  @override
  DropSchemaBuilder cascade([bool value = true]) {
    return _DropSchemaBuilder(
      executor: executor,
      identifier: identifier,
      spec: DropSchemaSpec(
        name: spec.name,
        ifExists: spec.ifExists,
        cascade: value,
      ),
    );
  }

  @override
  DropSchemaBuilder ifExists([bool value = true]) {
    return _DropSchemaBuilder(
      executor: executor,
      identifier: identifier,
      spec: DropSchemaSpec(
        name: spec.name,
        ifExists: value,
        cascade: spec.cascade,
      ),
    );
  }

  @override
  DropSchemaSpec toSpec() => spec;

  @override
  CompiledQuery<void> compile() => executor.compile(spec);

  @override
  Future<QueryResult<void>> execute() {
    return executor.execute(compile(), identifier);
  }
}
