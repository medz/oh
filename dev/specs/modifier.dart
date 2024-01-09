import '../visitors/visitor.dart';
import 'spec.dart';

enum ModifierLocation {
  /// The modifier is located before the specification.
  before,

  /// The modifier is located after the specification.
  after,
}

class Modifier implements Spec {
  /// The modifier specification.
  final Spec spec;

  /// The modifier location
  final ModifierLocation location;

  /// Creates a modifier specification.
  const Modifier({
    required this.spec,
    required this.location,
  });

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) {
    return visitor.visitModifier(this, context);
  }
}
