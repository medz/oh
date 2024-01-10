import '../../driver/database_support.dart';
import '../../specs/create_table_spec.dart';
import 'table_builder.dart';

extension CreateTableBuilder$DatabaseSupportCreateIfNotExists<
    DB extends DatabaseSupportCreateIfNotExists,
    T> on TableBuilder<DB, CreateTableSpec, T> {
  bool get ifNotExists => spec.ifNotExists;

  set ifNotExists(bool value) => spec = spec.copyWith(ifNotExists: value);

  CreateTableSpec toSpec() {
    return spec.copyWith(
      columns: columns.map((e) => e.toSpec()),
    );
  }
}
