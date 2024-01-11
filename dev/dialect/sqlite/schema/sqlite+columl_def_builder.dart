// ignore_for_file: file_names

import '../../../schema/builders/table_column_def_builder.dart';
import '../../../specs/data_type_spec.dart';
import '../specs/sqlite_storage_data_types.dart';
import '../sqlite.dart';

extension SQLiteAutoIncrement$TableColumnDefBuilder
    on TableColumnDefBuilder<SQLite, int> {
  /// Changes the column to be an auto-incrementing.
  TableColumnDefBuilder<SQLite, int> autoIncrement() {
    if (toSpec().dataType is SQLiteIntegerStorageDataTypeSpec) {
      updateSpec((spec) => spec.copyWith(autoIncrement: true));

      return this;
    }

    if (toSpec().dataType case DataTypeSpec(name: final name)
        when name == "INTEGER") {
      updateSpec(
        (spec) => spec.copyWith(
          autoIncrement: true,
          dataType: const SQLiteIntegerStorageDataTypeSpec(),
        ),
      );

      return this;
    }

    throw StateError('Only INTEGER column can be AUTOINCREMENT in SQLite');
  }
}
