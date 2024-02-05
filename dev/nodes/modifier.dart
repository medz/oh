import 'node.dart';

enum ModifierPosition { before, after }

class Modifier {
  final ModifierPosition position;
  final Node node;

  const Modifier({
    required this.position,
    required this.node,
  });
}
