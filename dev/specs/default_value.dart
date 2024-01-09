import '../visitors/visitor.dart';
import 'spec.dart';

class DefaultValue implements Spec {
  /// The default value specification.
  final Spec value;

  /// Creates a default value specification.
  const DefaultValue(this.value);

  @override
  T accept<T>(SpecVisitor<T> visitor, [T? context]) =>
      visitor.visitDefaultValue(this, context);
}
