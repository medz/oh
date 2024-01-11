// ignore_for_file: file_names

import '../../../schema/builders/create_table_builder.dart';
import '../../../schema/builders/table_column_def_builder.dart';
import '../specs/sqlite_storage_data_types.dart';
import '../sqlite.dart';

extension SQLiteStorageDataTypes$CreateTableBuilder
    on CreateTableBuilder<SQLite> {
  TableColumnDefBuilder<SQLite, void> null$(String name) =>
      column(name, const SQLiteNullStorageDataTypeSpec());

  TableColumnDefBuilder<SQLite, int> integer(String name) =>
      column(name, const SQLiteIntegerStorageDataTypeSpec());

  TableColumnDefBuilder<SQLite, double> real(String name) =>
      column(name, const SQLiteRealStorageDataTypeSpec());

  TableColumnDefBuilder<SQLite, String> text(String name) =>
      column(name, const SQLiteTextStorageDataTypeSpec());

  TableColumnDefBuilder<SQLite, List<int>> blob(String name) =>
      column(name, const SQLiteBlobStorageDataTypeSpec());
}
