import 'identifier_spec.dart';
import 'statement_spec.dart';

class DropSchemaSpec implements StatementSpec {
  /// The name of the schema to drop.
  final IdentifierSpec name;

  /// Whether to drop the schema only if it exists.
  final bool ifExists;

  /// Whether to drop all objects in the schema, such as tables, views, and
  /// functions.
  final bool cascade;

  const DropSchemaSpec({
    required this.name,
    this.ifExists = false,
    this.cascade = false,
  });
}
