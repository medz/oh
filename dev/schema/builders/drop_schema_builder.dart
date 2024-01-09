import '../../query_builder/statement_builder.dart';
import '../../specs/drop_schema_spec.dart';

abstract interface class DropSchemaBuilder
    implements StatementBuilder<DropSchemaSpec, void> {
  DropSchemaBuilder ifExists([bool value]);
  DropSchemaBuilder cascade([bool value]);
}
