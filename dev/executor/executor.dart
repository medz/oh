import 'dart:async';

import '../compiler/compiler.dart';
import '../driver/connection_provider.dart';
import '../driver/database_connection.dart';
import '../nodes/node.dart';

class Executor implements ConnectionProvider, DatabaseConnection, Compiler {
  final ConnectionProvider _provider;
  final Compiler _compiler;

  const Executor({
    required ConnectionProvider provider,
    required Compiler compiler,
  })  : _provider = provider,
        _compiler = compiler;

  @override
  CompiledResult<T> compile<T>(RootNode node) => _compiler.compile<T>(node);

  @override
  Future<T> provide<T>(
          FutureOr<T> Function(DatabaseConnection connection) consumer) =>
      _provider.provide(consumer);

  @override
  Future<ExecutedResult<T>> execute<T>(CompiledResult<T> compiled) {
    return provide((connection) => connection.execute(compiled));
  }
}
