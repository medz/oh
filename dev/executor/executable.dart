import 'dart:async';

import '../driver/database_connection.dart';
import '../nodes/node.dart';
import '../nodes/node_source.dart';
import 'executor.dart';

class Executable<T extends RootNode, R>
    implements Future<ExecutedResult<R>>, NodeSource<T> {
  final Executor _executor;
  final FutureOr<R> Function(dynamic) _mapper;
  final T _node;

  const Executable({
    required Executor executor,
    required FutureOr<R> Function(dynamic) mapper,
    required T node,
  })  : _executor = executor,
        _mapper = mapper,
        _node = node;

  @override
  T get node => _node;

  @override
  Stream<ExecutedResult<R>> asStream() => execute().asStream();

  @override
  Future<ExecutedResult<R>> catchError(Function onError,
      {bool Function(Object error)? test}) {
    return execute().catchError(onError, test: test);
  }

  @override
  Future<ExecutedResult<R>> whenComplete(FutureOr<void> Function() action) {
    return execute().whenComplete(action);
  }

  @override
  Future<V> then<V>(FutureOr<V> Function(ExecutedResult<R> value) onValue,
      {Function? onError}) {
    return execute().then(onValue, onError: onError);
  }

  @override
  Future<ExecutedResult<R>> timeout(Duration timeLimit,
      {FutureOr<ExecutedResult<R>> Function()? onTimeout}) {
    return execute().timeout(timeLimit, onTimeout: onTimeout);
  }
}

extension<T extends RootNode, R> on Executable<T, R> {
  Future<ExecutedResult<R>> execute() async {
    final compiled = _executor.compile<R>(_node);
    final result = await _executor.execute(compiled);

    final rows = <R>[];
    for (final row in result.rows) {
      rows.add(await _mapper(row));
    }

    return ExecutedResult(
      rows: rows,
      affectedRows: result.affectedRows,
      lastInsertId: result.lastInsertId,
    );
  }
}
