import 'blueprint.dart';
import 'column.dart';
import 'relations.dart';

class Table {
  final String name;
  final String? table;
  final String? schema;
  final List<Column> columns;
  final List<Relation> relations;

  const Table.from(
    this.name, {
    this.table,
    this.schema,
    required this.columns,
    required this.relations,
  });

  factory Table(String name, void Function(Blueprint blueprint) closure,
      {String? table, String? schema}) {
    final inner = Table.from(name,
        table: table, schema: schema, columns: [], relations: []);
    final blueprint = Blueprint(inner);

    // Call the closure to register columns.
    closure(blueprint);

    return inner;
  }

  /// Selects a column from the table.
  ///
  /// ```dart
  /// final id = table("id")
  /// ```
  Column<S, T> call<S, T>(String name) {
    final column = columns.firstWhere((element) {
      return switch (element) {
        Column<S, T>() => true,
        _ => false,
      };
    });

    return column as Column<S, T>;
  }
}
