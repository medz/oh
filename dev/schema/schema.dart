import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/create_schema_spec.dart';
import '../specs/drop_schema_spec.dart';
import '../specs/identifier_spec.dart';
import 'builders/create_schema_builder.dart';
import 'builders/drop_schema_builder.dart';

final class Schema<T> {
  final QueryExecutor<T> _executor;

  const Schema(QueryExecutor<T> executor) : _executor = executor;

  /// Creates a new schema with the given [name].
  CreateSchemaBuilder createSchema(String name) {
    return CreateSchemaBuilder(
      identifier: QueryIdentifier(),
      executor: _executor,
      spec: CreateSchemaSpec(
        name: IdentifierSpec(name),
      ),
    );
  }

  /// Drops the schema with the given [name].
  DropSchemaBuilder dropSchema(String name) {
    return DropSchemaBuilder(
      identifier: QueryIdentifier(),
      executor: _executor,
      spec: DropSchemaSpec(
        name: IdentifierSpec(name),
      ),
    );
  }
}
