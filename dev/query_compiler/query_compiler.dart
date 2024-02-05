import '../nodes/node.dart';
import 'compiled_query.dart';

abstract interface class QueryCompiler {
  CompiledQuery compileQuery(RootNode node);
}
