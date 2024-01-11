import '../../../specs/spec_visitor.dart';

class SQLiteSpecVisitor extends SpecVistor {
  const SQLiteSpecVisitor();

  @override
  String get autoIncrementIdentifier => 'AUTOINCREMENT';
}
