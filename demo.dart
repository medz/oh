import 'dev/dialect/sqlite/schema/sqlite+columl_def_builder.dart';
import 'dev/dialect/sqlite/schema/sqlite+create_table_builder.dart';
import 'dev/dialect/sqlite/sqlite_dialect.dart';
import 'dev/oh.dart';
import 'dev/schema/builders/create_table_builder.dart';

void main(List<String> args) {
  final dialect = SQLiteDialect(
    factory: () => throw UnimplementedError(),
  );
  final oh = Oh(dialect);
  final createTable = oh.schema.createTable('users', (table) {
    table.ifNotExists = true;

    table.integer("id").primaryKey().autoIncrement();
    table.text("name").notNull();
    table.text("email").notNull().unique();
    table.text("password").notNull();
    table.text("remember_token").references('users', ['id']);
  });
  print(createTable.compile());
  print(oh.schema.dropTable('users').ifExists().compile());
}
