import '../../specs/create_table.dart';
import '../builder.dart';
import '../spec_source.dart';

class CreateTableBuilder<Database>
    implements Builder<Database>, SpecSource<CreateTable> {
  final CreateTable _spec;

  const CreateTableBuilder({
    required CreateTable spec,
  }) : _spec = spec;

  @override
  CreateTable toSpec() => _spec;
}
