import 'spec.dart';

class GeneratedSpec implements Spec {
  final bool byDefault;
  final bool always;
  final bool identity;
  final bool stored;
  final Spec? expression;

  const GeneratedSpec({
    this.byDefault = false,
    this.always = false,
    this.identity = false,
    this.stored = false,
    this.expression,
  });
}
