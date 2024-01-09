import '../specs/create_schema_spec.dart';
import '../specs/spec_source.dart';

// TODO: 移动到新的通用位置
abstract interface class DatabaseSupportSchema {}

abstract interface class CreateSchemaBuilder
    implements SpecSource<CreateSchemaSpec> {
  CreateSchemaBuilder ifNotExists([bool value]);
  CreateSchemaBuilder cascade([bool value]);
}
