import '../../compiler/compiler.dart';
import '../../specs/create_schema.dart';
import '../../specs/drop_schema.dart';
import '../../specs/identifier.dart';
import '../builder.dart';
import 'create_schema_builder.dart';
import 'drop_schema_builder.dart';

class SchemaBuilder<DB> implements Builder<DB> {
  final String _name;
  final Compiler<DB> _compiler;

  const SchemaBuilder(String name, {required Compiler<DB> compiler})
      : _name = name,
        _compiler = compiler;

  /// Creates a create schema builder.
  CreateSchemaBuilder<DB> get create => CreateSchemaBuilder(
        spec: CreateSchema(Identifier(_name)),
      );

  /// Creates a create schema builder.
  DropSchemaBuilder get drop => DropSchemaBuilder(
        compiler: _compiler,
        spec: DropSchema(Identifier(_name)),
      );
}
