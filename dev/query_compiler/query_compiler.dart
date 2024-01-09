import '../specs/statement_spec.dart';
import 'compiled_query.dart';

abstract interface class QueryCompiler<T> {
  /// Compiles the query into a [CompiledQuery] object.
  CompiledQuery<T> compile(StatementSpec spec);
}
