import 'common_table_expression_spec.dart';
import 'spec.dart';

class WithSpec implements Spec {
  final bool recursive;
  final Iterable<CommonTableExpressionSpec> expressions;

  const WithSpec({
    this.recursive = false,
    required this.expressions,
  });
}
