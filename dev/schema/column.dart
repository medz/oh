import 'native_type.dart';
import 'table.dart';

class Column<S, T> {
  final String name;
  final String? column;
  final Table table;
  final NativeType<S, T>? type;
  final bool nullable;
  final bool unique;
  final bool primary;

  const Column(
    this.name,
    this.table, {
    this.column,
    this.type,
    this.nullable = false,
    this.primary = false,
    this.unique = false,
  });

  Column<S, T> copyWith({
    bool? nullable,
    bool? unique,
    bool? primary,
  }) {
    return Column<S, T>(
      name,
      table,
      column: column,
      type: type,
      nullable: nullable ?? this.nullable,
      unique: unique ?? this.unique,
      primary: primary ?? this.primary,
    );
  }
}
