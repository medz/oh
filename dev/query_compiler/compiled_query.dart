import '../specs/statement_spec.dart';

class CompiledQuery<T> {
  /// The SQL query spec.
  final StatementSpec statement;

  /// Compiled query parameters.
  final Iterable<Object> params;

  /// Compiled query SQL string.
  final String sql;

  /// Creates a compiled query.
  const CompiledQuery({
    required this.statement,
    required this.sql,
    required this.params,
  });

  @override
  String toString() => sql;
}
