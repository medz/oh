import 'node.dart';

abstract interface class NodeSource<T extends Node> {
  T get node;
}
