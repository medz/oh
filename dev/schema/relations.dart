enum RelationAction {
  cascade,
  restrict,
  noAction,
  setNull,
  setDefault,
}

abstract base class Relation {
  final String table;

  const Relation({required this.table});
}

/// A class for one-to-one relation.
final class HasOne extends Relation {
  final String foreignKey;
  final String? localKey;

  /// Defines relation on delete behavior.
  final RelationAction? onDelete;

  /// Defines relation on update behavior.
  final RelationAction? onUpdate;

  const HasOne({
    required super.table,
    required this.foreignKey,
    this.localKey,
    this.onDelete,
    this.onUpdate,
  });
}

/// A class for one-to-many relation.
final class HasMany extends Relation {
  final String foreignKey;
  final String? localKey;

  const HasMany({
    required super.table,
    required this.foreignKey,
    this.localKey,
  });
}

/// A class for many-to-many relation.
final class BelongsToMany extends Relation {
  final String pivotTable;
  final String foreignPivotKey;
  final String relatedPivotKey;
  final String? parentKey;
  final String? relatedKey;

  const BelongsToMany({
    required super.table,
    required this.pivotTable,
    required this.foreignPivotKey,
    required this.relatedPivotKey,
    this.parentKey,
    this.relatedKey,
  });
}

/// A class for many-to-one relation.
final class BelongsTo extends Relation {
  final String foreignKey;
  final String? ownerKey;

  final RelationAction? onDelete;
  final RelationAction? onUpdate;

  const BelongsTo({
    required super.table,
    required this.foreignKey,
    this.ownerKey,
    this.onDelete,
    this.onUpdate,
  });
}
