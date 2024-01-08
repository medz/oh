/// SQL specification.
///
/// All specifications are immutable.
abstract class Spec {}

/// Root specification for SQL.
///
/// Implementations of this interface are used to generate SQL statements.
///
/// E.g.: `CREATE TABLE ...`, `SELECT ...`, `INSERT ...`, `UPDATE ...`, `DELETE ...`.
abstract class RootSpec implements Spec {}
