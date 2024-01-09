import '../specs/statement_spec.dart';
import 'compiled_query.dart';

abstract interface class QueryCompiler {
  /// Compiles the query into a [CompiledQuery] object.
  CompiledQuery<T> compile<T>(StatementSpec spec);
}
