import 'dart:typed_data';

import '../../../schema/builders/table_builder.dart';
import '../../../schema/builders/table_column_def_builder.dart';
import '../../../specs/column_spec.dart';
import '../../../specs/data_type_spec.dart';
import '../../../specs/identifier_spec.dart';
import '../../../specs/statement_spec.dart';
import '../../../specs/table_column_def_spec.dart';
import '../sqlite.dart';

typedef _Int = int;

extension SQLiteStrageDataType$TableBuilder<T extends StatementSpec, R>
    on TableBuilder<SQLite, T, R> {
  /// Create `INTERVAL` column.
  TableColumnDefBuilder<SQLite, int> integer(String name) {
    return withConstDataType(name, 'INTEGER');
  }

  /// Create `TEXT` column.
  TableColumnDefBuilder<SQLite, String> text(String name) {
    return withConstDataType(name, 'TEXT');
  }

  /// Create `REAL` column.
  TableColumnDefBuilder<SQLite, double> real(String name) {
    return withConstDataType(name, 'REAL');
  }

  /// Create `BLOB` column.
  TableColumnDefBuilder<SQLite, Uint8List> blob(String name) {
    return withConstDataType(name, 'BLOB');
  }

  /// Create a `NULL` column.
  TableColumnDefBuilder<SQLite, void> null$(String name) {
    return withConstDataType(name, 'NULL');
  }
}

extension SQLiteIntegerAffnity$TableBuilder<T extends StatementSpec, R>
    on TableBuilder<SQLite, T, R> {
  /// Create `INT` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> int(String name) {
    return withConstDataType(name, 'INT');
  }

  /// Create `TINYINT` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> tinyInt(String name) {
    return withConstDataType(name, 'TINYINT');
  }

  /// Create `SMALLINT` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> smallInt(String name) {
    return withConstDataType(name, 'SMALLINT');
  }

  /// Create `MEDIUMINT` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> mediumInt(String name) {
    return withConstDataType(name, 'MEDIUMINT');
  }

  /// Create `BIGINT` column.
  TableColumnDefBuilder<SQLite, BigInt> bigInt(String name) {
    return withConstDataType(name, 'BIGINT');
  }

  /// Create `UNSIGNED BIG INT` column.
  TableColumnDefBuilder<SQLite, BigInt> unsignedBigInt(String name) {
    return withConstDataType(name, 'UNSIGNED BIG INT');
  }

  /// Create `INT2` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> int2(String name) {
    return withConstDataType(name, 'INT2');
  }

  /// Create `INT8` column.
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Int> int8(String name) {
    return withConstDataType(name, 'INT8');
  }
}

extension SQLiteTextAffnoty$TableBuilder<T extends StatementSpec, R>
    on TableBuilder<SQLite, T, R> {
  /// `CHARACTER(20)` column.
  TableColumnDefBuilder<SQLite, String> character20(String name) {
    return withConstDataType(name, 'CHARACTER(20)');
  }

  /// `VARCHAR(255)` column.
  TableColumnDefBuilder<SQLite, String> varchar255(String name) {
    return withConstDataType(name, 'VARCHAR(255)');
  }

  /// VARYING CHARACTER(255)
  TableColumnDefBuilder<SQLite, String> varyingCharacter255(String name) {
    return withConstDataType(name, 'VARYING CHARACTER(255)');
  }

  /// NCHAR(55)
  TableColumnDefBuilder<SQLite, String> nchar55(String name) {
    return withConstDataType(name, 'NCHAR(55)');
  }

  /// NATIVE CHARACTER(70)
  TableColumnDefBuilder<SQLite, String> nativeCharacter70(String name) {
    return withConstDataType(name, 'NATIVE CHARACTER(70)');
  }

  /// NVARCHAR(100)
  TableColumnDefBuilder<SQLite, String> nvarchar100(String name) {
    return withConstDataType(name, 'NVARCHAR(100)');
  }

  /// CLOB
  TableColumnDefBuilder<SQLite, String> clob(String name) {
    return withConstDataType(name, 'CLOB');
  }
}

typedef _Double = double;

extension SQLiteRealAffinity$TableBuilder<T extends StatementSpec, R>
    on TableBuilder<SQLite, T, R> {
  /// DOUBLE
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Double> double(String name) {
    return withConstDataType(name, 'DOUBLE');
  }

  /// DOUBLE PRECISION
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Double> doublePrecision(String name) {
    return withConstDataType(name, 'DOUBLE PRECISION');
  }

  /// FLOAT
  // ignore: library_private_types_in_public_api
  TableColumnDefBuilder<SQLite, _Double> float(String name) {
    return withConstDataType(name, 'FLOAT');
  }
}

extension SQLiteNumericAffinity$TableBuilder<T extends StatementSpec, R>
    on TableBuilder<SQLite, T, R> {
  /// NUMERIC
  TableColumnDefBuilder<SQLite, num> numeric(String name) {
    return withConstDataType(name, 'NUMERIC');
  }

  /// DECIMAL(10,5)
  TableColumnDefBuilder<SQLite, num> decimal10_5(String name) {
    return withConstDataType(name, 'DECIMAL(10,5)');
  }

  /// BOOLEAN
  TableColumnDefBuilder<SQLite, bool> boolean(String name) {
    return withConstDataType(name, 'BOOLEAN');
  }

  /// DATE
  TableColumnDefBuilder<SQLite, DateTime> date(String name) {
    return withConstDataType(name, 'DATE');
  }

  /// DATETIME
  TableColumnDefBuilder<SQLite, DateTime> datetime(String name) {
    return withConstDataType(name, 'DATETIME');
  }
}

extension AutoIncrement$TableColumnDefBuilder<DB, T extends int>
    on TableColumnDefBuilder<DB, T> {
  /// Set `AUTOINCREMENT` to column.
  TableColumnDefBuilder<DB, T> autoIncrement() {
    if (spec.dataType case DataTypeSpec(name: final name)
        when name == 'INTEGER') {
      spec = spec.copyWith(autoIncrement: true);

      return this;
    }

    throw StateError('Only INTEGER column can be AUTOINCREMENT');
  }
}

extension<T extends StatementSpec, R> on TableBuilder<SQLite, T, R> {
  /// Create constraint data type column builder.
  TableColumnDefBuilder<SQLite, DartType> withConstDataType<DartType>(
    String name,
    String dataType,
  ) {
    final def = TableColumnDefSpec(
      column: ColumnSpec(name: IdentifierSpec(name)),
      dataType: DataTypeSpec(dataType),
    );
    final builder = TableColumnDefBuilder<SQLite, DartType>(def);
    columns.add(builder);

    return builder;
  }
}
