import '../../specs/create_schema.dart';
import '../builder.dart';
import '../spec_source.dart';

class CreateSchemaBuilder<T> implements Builder<T>, SpecSource<CreateSchema> {
  final CreateSchema _spec;

  const CreateSchemaBuilder({
    required CreateSchema spec,
  }) : _spec = spec;

  @override
  CreateSchema toSpec() => _spec;

  /// Whether to create the schema if it does not exist.
  CreateSchemaBuilder<T> ifNotExists() {
    return CreateSchemaBuilder<T>(
      spec: CreateSchema(
        _spec.name,
        ifNotExists: true,
      ),
    );
  }
}
