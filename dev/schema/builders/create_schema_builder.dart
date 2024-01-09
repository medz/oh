import '../../query_builder/statement_builder.dart';
import '../../specs/create_schema_spec.dart';

abstract interface class CreateSchemaBuilder
    implements StatementBuilder<CreateSchemaSpec, void> {
  CreateSchemaBuilder ifNotExists([bool value]);
  CreateSchemaBuilder cascade([bool value]);
}
