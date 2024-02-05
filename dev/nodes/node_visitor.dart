import 'node.dart';

abstract class NodeVistor {
  NodeVistor();

  final StringBuffer sql = StringBuffer();
  final List params = [];

  void visitNode(Node node) {}
}
