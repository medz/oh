import '../specs/create_schema_spec.dart';
import '../specs/spec_source.dart';

abstract interface class DatabaseSupportSchema {}

abstract interface class CreateSchemaBuilder
    implements SpecSource<CreateSchemaSpec> {
  CreateSchemaBuilder ifNotExists([bool value]);
  CreateSchemaBuilder cascade([bool value]);
}
