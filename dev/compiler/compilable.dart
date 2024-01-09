import 'compiled_query.dart';

abstract interface class Compilable<T> {
  CompiledQuery<T> compile();
}
