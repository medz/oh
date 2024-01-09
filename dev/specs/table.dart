import '../visitors/visitor.dart';
import 'spec.dart';
import 'identifier.dart';

/// Table specification.
class Table implements Spec {
  /// The table name.
  final Identifier name;

  /// The table schema.
  final Identifier? schema;

  /// Creates a table specification.
  const Table(this.name, [this.schema]);

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitTable(this, context);
  }
}
