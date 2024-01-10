import 'dev/dialect/sqlite/sqlite_dialect.dart';
import 'dev/oh.dart';

void main(List<String> args) {
  final dialect = SQLiteDialect(
    factory: () => throw UnimplementedError(),
  );
  final oh = Oh(dialect: dialect);
  final builder = oh.schema.dropSchema("demo").ifExists().cascade();

  print(builder.compile().sql);
}
