import '../driver/database_support.dart';
import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/create_schema_spec.dart';
import '../specs/create_table_spec.dart';
import '../specs/drop_schema_spec.dart';
import '../specs/identifier_spec.dart';
import '../specs/table_spec.dart';
import 'builders/create_schema_builder.dart';
import 'builders/drop_schema_builder.dart';
import 'builders/table_builder.dart';

final class Schema<DB> {
  final QueryExecutor<DB> _executor;

  const Schema(QueryExecutor<DB> executor) : _executor = executor;

  /// Creates a new create table builder.
  TableBuilder<DB, CreateTableSpec, void> createTable(
    String name,
    void Function(TableBuilder<DB, CreateTableSpec, void> table) builder,
  ) {
    final table = TableBuilder<DB, CreateTableSpec, void>(
      identifier: QueryIdentifier(),
      executor: _executor,
      spec: CreateTableSpec(
        table: TableSpec(name: IdentifierSpec(name)),
      ),
    );

    builder(table);

    return table;
  }
}

extension Schema$DatabaseSupportSchema<T extends DatabaseSupportSchema>
    on Schema<T> {
  /// Creates a new schema with the given [name].
  CreateSchemaBuilder<T> createSchema(String name) {
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
