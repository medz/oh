import 'spec.dart';

class DataTypeSpec implements Spec {
  final String _inner;

  String get name => _inner;

  const DataTypeSpec(String name) : _inner = name;
}
