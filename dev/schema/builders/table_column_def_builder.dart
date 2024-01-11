import '../../specs/column_spec.dart';
import '../../specs/identifier_spec.dart';
import '../../specs/references_spec.dart';
import '../../specs/spec_source.dart';
import '../../specs/table_column_def_spec.dart';
import '../../specs/table_spec.dart';

class TableColumnDefBuilder<DB, T> implements SpecSource<TableColumnDefSpec> {
  TableColumnDefSpec _spec;

  TableColumnDefBuilder(TableColumnDefSpec spec) : _spec = spec;

  @override
  TableColumnDefSpec toSpec() => _spec;

  /// Updates the column spec.
  void updateSpec(TableColumnDefSpec Function(TableColumnDefSpec spec) fn) {
    _spec = fn(_spec);
  }

  /// Changes the column to be a primary key.
  TableColumnDefBuilder<DB, T> primaryKey() {
    _spec = _spec.copyWith(primaryKey: true);

    return this;
  }

  /// Changes the column to have nulls not distinct.
  TableColumnDefBuilder<DB, T> nullsNotDistinct() {
    _spec = _spec.copyWith(nullsNotDistinct: true);

    return this;
  }

  /// Changes the column to be unique.
  TableColumnDefBuilder<DB, T> unique() {
    _spec = _spec.copyWith(unique: true);

    return this;
  }

  /// Changes the column to be not null.
  TableColumnDefBuilder<DB, T> notNull() {
    _spec = _spec.copyWith(notNull: true);

    return this;
  }

  /// Changes the column to nullsNotDistinct is true.
  TableColumnDefBuilder<DB, T> notDistinct() {
    _spec = _spec.copyWith(nullsNotDistinct: true);

    return this;
  }

  /// Adds a reference to the table.
  TableColumnDefBuilder<DB, T> references(
    String table,
    Iterable<String> columns, {
    OnModifyForeignAction? onDelete,
    OnModifyForeignAction? onUpdate,
  }) {
    final ref = ReferencesSpec(
      table: TableSpec(name: IdentifierSpec(table)),
      columns: columns.map((e) => ColumnSpec(name: IdentifierSpec(e))),
      onDelete: onDelete,
      onUpdate: onUpdate,
    );

    _spec = _spec.copyWith(references: ref);

    return this;
  }
}
