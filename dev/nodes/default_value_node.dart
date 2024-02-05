import 'node.dart';

class DefaultValueNode implements Node {
  final Node value;

  const DefaultValueNode({required this.value});
}
