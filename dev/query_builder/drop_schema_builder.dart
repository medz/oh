import '../specs/drop_schema_spec.dart';
import '../specs/spec_source.dart';

abstract interface class DropSchemaBuilder
    implements SpecSource<DropSchemaSpec> {
  DropSchemaBuilder ifExists([bool value]);
  DropSchemaBuilder cascade([bool value]);
}
