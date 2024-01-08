import '../../builder/builder.dart';
import '../../builder/dml/create_schema_builder.dart';
import '../../builder/dml/drop_schema_builder.dart';
import '../../specs/create_schema.dart';
import '../../specs/drop_schema.dart';
import '../../specs/identifier.dart';
import 'postgresql.dart';

abstract class PostgreSQLSchemaBuilder implements Builder<PostgreSQL> {
  /// The schema name.
  final String _name;

  /// Internal constructor.
  const PostgreSQLSchemaBuilder(String name) : _name = name;

  /// Creates a create schema builder.
  CreateSchemaBuilder<PostgreSQL> get create => CreateSchemaBuilder(
        spec: CreateSchema(Identifier(_name)),
      );

  /// Creates a create schema builder.
  DropSchemaBuilder get drop => DropSchemaBuilder(
        spec: DropSchema(Identifier(_name)),
      );
}
