import 'node.dart';

class GeneratedNode implements Node {
  final bool byDefault;
  final bool always;
  final bool identity;
  final bool stored;
  final Node? expression;

  const GeneratedNode({
    this.byDefault = false,
    this.always = false,
    this.identity = false,
    this.stored = false,
    this.expression,
  });
}
