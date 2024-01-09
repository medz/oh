import '../specs/spec.dart';

class CompiledQuery<T> {
  final Spec spec;
  final String sql;
  final Iterable<Object> params;

  const CompiledQuery({
    required this.spec,
    required this.sql,
    this.params = const [],
  });
}
