import '../specs/column_def_spec.dart';
import '../specs/column_spec.dart';
import '../specs/data_type_spec.dart';
import '../specs/identifier_spec.dart';
import '../specs/references_spec.dart';
import '../specs/schemable_identifier_spec.dart';
import '../specs/spec_source.dart';
import '../specs/table_spec.dart';
import 'references_builder.dart';

class ColumnDefBuilder<DB, Type> extends SpecSource<ColumnDefSpec> {
  const ColumnDefBuilder({required super.spec});

  /// Creates a new column definition builder with a new column native data
  /// type.
  ///
  /// Example:
  /// ```dart
  /// final column = table.integer('id'); // id INTEGER
  ///
  /// column.nativeType('BIGINT'); // id BIGINT
  /// ```
  ///
  /// The [T] is native data type binding to dart type.
  ///
  /// ```dart
  /// final newColumn = column.nativeType<String>('TEXT'); // id TEXT
  ///
  /// newColumn.defaultTo("Hi"); // ✅ id TEXT DEFAULT 'Hi'
  /// newColumn.defaultTo(1); // ❌ Error: The default value must be a String.
  /// ```
  ColumnDefBuilder<DB, T> nativeType<T>(String type) {
    return ColumnDefBuilder<DB, T>(
      spec: toSpec().copyWith(
        dataType: DataTypeSpec(type),
      ),
    );
  }

  /// Creates a new column definition builder with references.
  ///
  /// Example:
  /// ```dart
  /// final column = table.integer('id').references("users", "id");
  /// ```
  ColumnDefBuilder<DB, Type> references(
    String table,
    String column, [
    ReferencesBuilder Function(ReferencesBuilder references)? closure,
  ]) {
    final spec = toSpec();
    final references = ReferencesSpec(
      table: TableSpec(
        table: SchemableIdentifierSpec(identifier: IdentifierSpec(table)),
      ),
      columns: [ColumnSpec(name: IdentifierSpec(column))],
    );
    final builder = ReferencesBuilder(spec: references);
    final result = closure?.call(builder) ?? builder;

    return ColumnDefBuilder<DB, Type>(
      spec: spec.copyWith(
        references: result.toSpec(),
      ),
    );
  }

  /// Creates a new column definition builder with is primary key.
  ColumnDefBuilder<DB, Type> primaryKey() {
    return ColumnDefBuilder<DB, Type>(
      spec: toSpec().copyWith(primaryKey: true),
    );
  }

  /// Creates a new column definition builder with is auto increment.
  ColumnDefBuilder<DB, Type> autoIncrement() {
    return ColumnDefBuilder<DB, Type>(
      spec: toSpec().copyWith(autoIncrement: true),
    );
  }
}
