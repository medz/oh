// ignore_for_file: file_names

import '../oh.dart';
import '../specs/create_schema_spec.dart';
import '../specs/identifier_spec.dart';
import 'create_schema_builder.dart';

extension Oh$CreateSchema<T extends DatabaseSupportSchema> on Oh<T> {
  CreateSchemaBuilder createSchema(
    String name, {
    bool ifNotExists = false,
    bool cascade = false,
  }) {
    assert(name.isNotEmpty, 'schema name cannot be empty');

    return _CreateSchemaBuilder(name, ifNotExists, cascade);
  }
}

class _CreateSchemaBuilder implements CreateSchemaBuilder {
  final String _name;
  final bool _ifNotExists;
  final bool _cascade;

  const _CreateSchemaBuilder(this._name,
      [this._ifNotExists = false, this._cascade = false]);

  @override
  CreateSchemaBuilder cascade([bool value = true]) {
    return _CreateSchemaBuilder(_name, _ifNotExists, value);
  }

  @override
  CreateSchemaBuilder ifNotExists([bool value = true]) {
    return _CreateSchemaBuilder(_name, value, _cascade);
  }

  @override
  CreateSchemaSpec toSpec() {
    return CreateSchemaSpec(
      name: IdentifierSpec(_name),
      ifNotExists: _ifNotExists,
      cascade: _cascade,
    );
  }
}
