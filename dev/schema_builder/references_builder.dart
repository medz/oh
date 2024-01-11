import '../specs/column_spec.dart';
import '../specs/identifier_spec.dart';
import '../specs/references_spec.dart';
import '../specs/spec_source.dart';

class ReferencesBuilder extends SpecSource<ReferencesSpec> {
  const ReferencesBuilder({required super.spec});

  /// Creates a new references builder and adds a new column to the references.
  ReferencesBuilder column(String name) {
    final spec = toSpec();

    return ReferencesBuilder(
      spec: spec.copyWith(
        columns: [
          ...spec.columns,
          ColumnSpec(name: IdentifierSpec(name)),
        ],
      ),
    );
  }

  /// Changes on delete action and returns a new references builder.
  ReferencesBuilder onDelete(OnModifyForeignAction action) {
    return ReferencesBuilder(
      spec: toSpec().copyWith(onDelete: action),
    );
  }

  /// Changes on update action and returns a new references builder.
  ReferencesBuilder onUpdate(OnModifyForeignAction action) {
    return ReferencesBuilder(
      spec: toSpec().copyWith(onUpdate: action),
    );
  }

  /// Resets the references columns and returns a new references builder.
  ReferencesBuilder resetColumns(Iterable<String> columns) {
    return ReferencesBuilder(
      spec: toSpec().copyWith(
        columns: columns.map((e) => ColumnSpec(name: IdentifierSpec(e))),
      ),
    );
  }
}
