class QueryResult<T> {
  final BigInt? numAffectedRows;
  final BigInt? numChangedRows;
  final BigInt? insertId;
  final Iterable<T> rows;

  const QueryResult({
    required this.rows,
    this.insertId,
    this.numAffectedRows,
    this.numChangedRows,
  });
}
