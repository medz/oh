import 'spec.dart';

abstract interface class SpecSource<T extends Spec> {
  /// The spec source converts to a spec.
  T toSpec();
}
