import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/create_schema_spec.dart';
import '../specs/drop_schema_spec.dart';
import '../specs/identifier_spec.dart';
import 'create_schema_builder.dart';
import 'drop_schema_builder.dart';

class SchemaBuilder<DB, Tag> {
  /// Current selected database schema.
  final String? name;

  /// Inner query executor.
  final QueryExecutor<DB> _executor;

  /// Creates a new schema builder.
  const SchemaBuilder({
    required QueryExecutor<DB> executor,
    this.name,
  }) : _executor = executor;
}

extension SchemaBuilder$Call<DB> on SchemaBuilder<DB, void> {
  /// Creates a new schema with the given [name].
  SchemaBuilder<DB, bool> call<T>(String name) {
    return SchemaBuilder<DB, bool>(name: name, executor: _executor);
  }

  /// Creates a new create schema builder.
  CreateSchemaBuilder<DB> create(String name, {bool ifNotExists = false}) =>
      call(name).create(ifNotExists: ifNotExists);

  /// Creates a new drop schema builder.
  DropSchemaBuilder<DB> drop(
    String name, {
    bool ifExists = false,
    bool cascade = false,
  }) {
    return call(name).drop(ifExists: ifExists, cascade: cascade);
  }
}

extension SchemaBuilder$Create<DB> on SchemaBuilder<DB, bool> {
  /// Creates a new create schema builder.
  CreateSchemaBuilder<DB> create({bool ifNotExists = false}) {
    return CreateSchemaBuilder(
      executor: _executor,
      identifier: QueryIdentifier(),
      spec: CreateSchemaSpec(
        name: IdentifierSpec(name!),
        ifNotExists: ifNotExists,
      ),
    );
  }

  /// Creates a new drop schema builder.
  DropSchemaBuilder<DB> drop({bool ifExists = false, bool cascade = false}) {
    return DropSchemaBuilder(
      executor: _executor,
      identifier: QueryIdentifier(),
      spec: DropSchemaSpec(
        name: IdentifierSpec(name!),
        ifExists: ifExists,
        cascade: cascade,
      ),
    );
  }
}
