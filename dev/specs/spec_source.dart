import 'spec.dart';

class SpecSource<T extends Spec> {
  final T _spec;

  const SpecSource({required T spec}) : _spec = spec;

  /// The spec source converts to a spec.
  T toSpec() => _spec;
}
