// ignore_for_file: file_names

import '../oh.dart';
import '../specs/drop_schema_spec.dart';
import '../specs/identifier_spec.dart';
import 'create_schema_builder.dart';
import 'drop_schema_builder.dart';

extension Oh$DropSchema<T extends DatabaseSupportSchema> on Oh<T> {
  DropSchemaBuilder dropSchema(
    String name, {
    bool ifExists = false,
    bool cascade = false,
  }) {
    assert(name.isNotEmpty, 'Schema name cannot be empty');

    return _DropSchemaBuilder(name, ifExists, cascade);
  }
}

class _DropSchemaBuilder implements DropSchemaBuilder {
  final String _name;
  final bool _ifExists;
  final bool _cascade;

  const _DropSchemaBuilder(this._name, this._ifExists, this._cascade);

  @override
  DropSchemaBuilder cascade([bool value = true]) {
    return _DropSchemaBuilder(_name, _ifExists, value);
  }

  @override
  DropSchemaBuilder ifExists([bool value = true]) {
    return _DropSchemaBuilder(_name, value, _cascade);
  }

  @override
  DropSchemaSpec toSpec() {
    return DropSchemaSpec(
      name: IdentifierSpec(_name),
      ifExists: _ifExists,
      cascade: _cascade,
    );
  }
}
