import 'query_executor/query_executor.dart';
import 'specs/with_spec.dart';

class QueryCreator<DB> {
  final WithSpec? _withSpec;
  final QueryExecutor<DB> _executor;

  const QueryCreator({
    required QueryExecutor<DB> executor,
    WithSpec? withSpec,
  })  : _executor = executor,
        _withSpec = withSpec;
}
