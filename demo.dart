import 'dev/dialect/postgresql/postgresql.dart';
import 'dev/dialect/postgresql/postgresql_schema_support.dart';
import 'dev/oh.dart';
import 'dev/schema/oh+schema.dart';

void main(List<String> args) {
  final oh = Oh<PostgreSQL>();

  final demo = oh.schema('name').drop.ifExists().cascade();
}
