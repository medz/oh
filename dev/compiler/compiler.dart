import '../nodes/node.dart';

abstract interface class Compiler {
  /// Compiles a root node.
  CompiledResult<T> compile<T>(RootNode node);
}

abstract interface class CompiledResult<T> {
  /// The compiled sql.
  String get sql;

  /// The compiled binding parameters.
  List get params;

  /// The compile root node.
  RootNode get node;
}
