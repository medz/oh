import 'dev/oh.dart';

void main(List<String> args) {
  final oh = Oh();
  final schema = oh.schema('auth').create();

  // await schema; => void;
  // schema.compile(); => ({String sql, List params});
  // schema.node; => CreateSchemaNode;
}
