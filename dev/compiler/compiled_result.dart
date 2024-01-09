import '../specs/spec.dart';

class CompiledResult<Database> {
  final Spec spec;
  final String sql;
  final Iterable<Object> params;

  const CompiledResult({
    required this.spec,
    required this.sql,
    this.params = const [],
  });
}
