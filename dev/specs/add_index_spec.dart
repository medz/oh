import 'identifier_spec.dart';
import 'raw_spec.dart';
import 'spec.dart';

class AddIndexSpec implements Spec {
  final IdentifierSpec name;
  final Iterable<Spec> columns;
  final bool unique;
  final RawSpec? using;
  final bool ifNotExists;

  const AddIndexSpec({
    required this.name,
    this.columns = const [],
    this.unique = false,
    this.using,
    this.ifNotExists = false,
  });
}
