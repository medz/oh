import 'dev/dialect/sqlite/sqlite_dialect.dart';
import 'dev/oh.dart';
import 'dev/schema_builder/schema_builder.dart';

void main(List<String> args) {
  final dialect = SQLiteDialect(
    factory: () => throw UnimplementedError(),
  );
  final oh = Oh(dialect);

  final public = oh.schema("public");

  print(public.create());
  print(public.create().ifNotExists());
}
