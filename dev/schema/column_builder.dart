import 'column.dart';
import 'table.dart';

class ColumnBuilder<S, T> {
  final Table table;
  final String name;

  const ColumnBuilder(this.table, this.name);

  /// Updates a column with a [name].
  void update(String name, Column<S, T> Function(Column<S, T> column) updates) {
    table.columns.setAll(0, table.columns.map((e) {
      if (e.name == name) {
        return updates(e as Column<S, T>);
      }

      return e;
    }));
  }

  /// Sets a column as a primary key.
  ColumnBuilder<S, T> primary() {
    update(name, (column) => column.copyWith(primary: true));
    return this;
  }

  /// Sets a column as a unique.
  ColumnBuilder<S, T> unique() {
    update(name, (column) => column.copyWith(unique: true));
    return this;
  }

  /// Sets a column as a nullable.
  ColumnBuilder<S, T> nullable() {
    update(name, (column) => column.copyWith(nullable: true));
    return this;
  }
}
