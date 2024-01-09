import '../../compiler/compilable.dart';
import '../../compiler/compiled_result.dart';
import '../../compiler/compiler.dart';
import '../../specs/drop_schema.dart';
import '../builder.dart';
import '../spec_source.dart';

class DropSchemaBuilder<DB>
    implements SpecSource<DropSchema>, Builder<DB>, Compilable<DB> {
  final DropSchema _spec;
  final Compiler<DB> _compiler;

  const DropSchemaBuilder({
    required DropSchema spec,
    required Compiler<DB> compiler,
  })  : _spec = spec,
        _compiler = compiler;

  @override
  DropSchema toSpec() => _spec;

  /// Whether to drop the schema if it exists.
  DropSchemaBuilder ifExists([bool value = true]) => DropSchemaBuilder(
        compiler: _compiler,
        spec: DropSchema(
          _spec.name,
          ifExists: value,
          cascade: _spec.cascade,
        ),
      );

  /// Whether to drop objects within the schema.
  DropSchemaBuilder cascade([bool value = true]) => DropSchemaBuilder(
        compiler: _compiler,
        spec: DropSchema(
          _spec.name,
          ifExists: _spec.ifExists,
          cascade: value,
        ),
      );

  @override
  CompiledResult<DB> compile() => _compiler.compile(toSpec());
}
