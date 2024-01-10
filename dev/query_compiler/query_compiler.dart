import '../specs/spec_visitor.dart';
import '../specs/statement_spec.dart';
import 'compiled_query.dart';

class QueryCompiler {
  final SpecVistor _visitor;

  const QueryCompiler(SpecVistor visitor) : _visitor = visitor;

  /// Compiles the query into a [CompiledQuery] object.
  CompiledQuery<T> compile<T>(StatementSpec spec) {
    final (sql, params) = _visitor.visitSpec(spec);
    return CompiledQuery<T>(sql: sql, statement: spec, params: params);
  }
}
