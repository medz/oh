import '../specs/spec.dart';

abstract interface class SpecSource<T extends Spec> {
  T toSpec();
}
