import '../dialect/dialect.dart';
import '../specs/spec.dart';
import 'compiled_result.dart';

class Compiler<DB> {
  final Dialect dialect;

  const Compiler({required this.dialect});

  /// Compiles a spec into a compiled result.
  CompiledResult<DB> compile<T extends Spec>(covariant T spec) {
    final buffer = StringBuffer();
    final params = <Object>[];

    final visitor = _CompilerVisitor<DB>(dialect, buffer, params);
    spec.accept(visitor);

    return CompiledResult<DB>(
        spec: spec, sql: buffer.toString(), params: params);
  }
}
