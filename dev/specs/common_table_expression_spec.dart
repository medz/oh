import 'common_table_expression_name_spec.dart';
import 'spec.dart';

class CommonTableExpressionSpec implements Spec {
  final CommonTableExpressionNameSpec name;
  final bool materialized;
  final Spec expression;

  const CommonTableExpressionSpec({
    required this.name,
    this.materialized = false,
    required this.expression,
  });
}
