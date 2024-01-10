import 'dev/dialect/sqlite/schema/sqlite_table_builder.dart';
import 'dev/dialect/sqlite/sqlite_dialect.dart';
import 'dev/oh.dart';
import 'dev/schema/builders/create_table_builder.dart';

void main(List<String> args) {
  final dialect = SQLiteDialect(
    factory: () => throw UnimplementedError(),
  );
  final oh = Oh(dialect);
  final demo = oh.schema.createTable('users', (table) {
    table.ifNotExists = true;

    table.integer("id").primaryKey().autoIncrement();
    table.text("name").notNull();
    table.text("email").notNull().unique();
    table.text("password").notNull();
    table.text("remember_token").references('users', ['id']);
  });

  print(oh.schema.dropTable('users').ifExists().compile());

  print(demo.compile().sql);
}
