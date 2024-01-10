import '../driver/database_connection.dart';
import '../query_compiler/compiled_query.dart';
import '../query_compiler/query_compilable.dart';
import '../query_executor/query_executable.dart';
import '../query_executor/query_executor.dart';
import '../query_executor/query_identifier.dart';
import '../specs/spec_source.dart';
import '../specs/statement_spec.dart';

abstract class StatementBuilder<DB, T extends StatementSpec, R>
    implements SpecSource<T>, QueryCompilable<R>, QueryExecutable<R> {
  final QueryIdentifier _identifier;
  final QueryExecutor<DB> _executor;

  const StatementBuilder({
    required QueryExecutor<DB> executor,
    required QueryIdentifier identifier,
  })  : _executor = executor,
        _identifier = identifier;

  @override
  CompiledQuery<R> compile() => _executor.compile(toSpec());

  @override
  Future<QueryResult<R>> execute() {
    return _executor.execute(compile(), _identifier);
  }
}
