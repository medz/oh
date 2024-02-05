import '../nodes/node.dart';

class CompiledQuery {
  final RootNode node;
  final String sql;
  final List params;

  const CompiledQuery({
    required this.node,
    required this.sql,
    required this.params,
  });
}
