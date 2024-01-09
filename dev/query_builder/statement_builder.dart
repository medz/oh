import '../query_compiler/query_compilable.dart';
import '../query_executor/query_executable.dart';
import '../specs/spec_source.dart';
import '../specs/statement_spec.dart';

abstract interface class StatementBuilder<T extends StatementSpec, R>
    implements SpecSource<T>, QueryCompilable<R>, QueryExecutable<R> {}
