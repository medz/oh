import 'identifier_spec.dart';
import 'spec.dart';

class SchemableIdentifierSpec implements Spec {
  final IdentifierSpec? schema;
  final IdentifierSpec identifier;

  const SchemableIdentifierSpec({
    this.schema,
    required this.identifier,
  });
}
