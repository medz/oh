import 'spec.dart';

class RawSpec implements Spec {
  final Iterable<(String sql, Spec param)> fragments;

  const RawSpec(this.fragments);
}
