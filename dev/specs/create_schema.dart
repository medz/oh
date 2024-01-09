import '../visitors/visitor.dart';
import 'spec.dart';
import 'identifier.dart';

/// `CREATE <schema> ...` specification.
///
/// See:
/// - [CREATE SCHEMA](https://www.postgresql.org/docs/11/sql-createschema.html)
///
/// **NOTE**: Available in PostgreSQL 9.3 and later, other databases may ignore
/// this specification.
class CreateSchema implements RootSpec {
  /// The schema name.
  final Identifier name;

  /// Whether to create the schema if it does not exist.
  final bool ifNotExists;

  /// Creates a new `CREATE SCHEMA` specification.
  const CreateSchema(this.name, {this.ifNotExists = false});

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) =>
      visitor.visitCreateSchema(this, context);
}
