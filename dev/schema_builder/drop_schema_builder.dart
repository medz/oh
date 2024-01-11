import '../query_builder/statement_builder.dart';
import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/drop_schema_spec.dart';

class DropSchemaBuilder<DB> extends StatementBuilder<DB, DropSchemaSpec, void> {
  final QueryExecutor<DB> _executor;
  final QueryIdentifier _identifier;

  const DropSchemaBuilder({
    required super.executor,
    required super.identifier,
    required super.spec,
  })  : _executor = executor,
        _identifier = identifier;

  /// Whether to drop the schema only if it exists.
  DropSchemaBuilder<DB> ifExists() {
    return DropSchemaBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: toSpec().copyWith(ifExists: true),
    );
  }

  /// Whether to drop all objects in the schema, such as tables, views, and
  /// functions.
  DropSchemaBuilder<DB> cascade() {
    return DropSchemaBuilder(
      executor: _executor,
      identifier: _identifier,
      spec: toSpec().copyWith(cascade: true),
    );
  }
}
