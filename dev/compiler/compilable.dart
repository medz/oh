import 'compiled_result.dart';

abstract interface class Compilable<T> {
  CompiledResult<T> compile();
}
