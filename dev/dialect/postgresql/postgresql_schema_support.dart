import '../../schema/schema.dart';
import 'postgresql.dart';
import 'postgresql_schema_builder.dart';

extension PostgreSQLSchemaSupport on Schema<PostgreSQL> {
  PostgreSQLSchemaBuilder call(String name) => _Builder(name);
}

class _Builder extends PostgreSQLSchemaBuilder {
  const _Builder(super.name);
}
