import '../dialect/dialect.dart';
import '../specs/spec.dart';
import 'compiled_query.dart';

class Compiler<DB> {
  final Dialect dialect;

  const Compiler({required this.dialect});

  /// Compiles a spec into a compiled result.
  CompiledQuery<T> compile<T>(RootSpec spec) {
    throw UnimplementedError();
  }
}
