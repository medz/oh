import 'compiled_query.dart';

abstract interface class QueryCompilable<T> {
  CompiledQuery<T> compile();
}
