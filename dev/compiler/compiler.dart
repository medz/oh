import '../specs/spec.dart';

abstract interface class Compiler<Database>
    implements Comparable<CompiledResult<Database>> {}

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
