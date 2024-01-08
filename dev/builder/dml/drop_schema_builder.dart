import '../../specs/drop_schema.dart';
import '../spec_source.dart';

class DropSchemaBuilder implements SpecSource<DropSchema> {
  final DropSchema _spec;

  const DropSchemaBuilder({
    required DropSchema spec,
  }) : _spec = spec;

  @override
  DropSchema toSpec() => _spec;

  /// Whether to drop the schema if it exists.
  DropSchemaBuilder ifExists([bool value = true]) => DropSchemaBuilder(
        spec: DropSchema(
          _spec.name,
          ifExists: value,
          cascade: _spec.cascade,
        ),
      );

  /// Whether to drop objects within the schema.
  DropSchemaBuilder cascade([bool value = true]) => DropSchemaBuilder(
        spec: DropSchema(
          _spec.name,
          ifExists: _spec.ifExists,
          cascade: value,
        ),
      );
}
