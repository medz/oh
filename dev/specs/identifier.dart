import '../visitors/visitor.dart';
import 'spec.dart';

/// SQL identifier specification.
class Identifier implements Spec {
  /// The identifier name.
  final String name;

  /// Creates a new identifier specification.
  const Identifier(this.name);

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitIdentifier(this, context);
  }
}
