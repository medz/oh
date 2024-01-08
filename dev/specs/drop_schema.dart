import 'spec.dart';
import 'identifier.dart';

/// `DROP <schema> ...` specification.
///
/// See:
///   - [DROP SCHEMA](https://www.postgresql.org/docs/11/sql-dropschema.html)
///
/// **NOTE**: Available in PostgreSQL 9.3 and later, other databases may ignore
/// this specification.
class DropSchema implements RootSpec {
  /// The schema name.
  final Identifier name;

  /// Whether to drop the schema if it exists.
  final bool ifExists;

  /// Whether to drop objects within the schema.
  final bool cascade;

  /// Creates a new `DROP SCHEMA` specification.
  const DropSchema(this.name, {this.ifExists = false, this.cascade = false});
}
