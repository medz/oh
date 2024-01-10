import 'spec.dart';

enum ModifierLocation {
  before,
  after,
}

class ModifierSpec implements Spec {
  final Spec value;
  final ModifierLocation location;

  const ModifierSpec({
    required this.value,
    required this.location,
  });
}
