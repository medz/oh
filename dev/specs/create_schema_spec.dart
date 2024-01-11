import 'identifier_spec.dart';
import 'statement_spec.dart';

class CreateSchemaSpec implements StatementSpec {
  final IdentifierSpec name;
  final bool ifNotExists;

  const CreateSchemaSpec({
    required this.name,
    this.ifNotExists = false,
  });

  CreateSchemaSpec copyWith({
    IdentifierSpec? name,
    bool? ifNotExists,
  }) {
    return CreateSchemaSpec(
      name: name ?? this.name,
      ifNotExists: ifNotExists ?? this.ifNotExists,
    );
  }
}
