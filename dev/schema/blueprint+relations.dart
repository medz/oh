// ignore_for_file: file_names

import 'blueprint.dart';
import 'relations.dart';

extension Blueprint$Relations on Blueprint {
  /// Adds a one-to-one relation to the table.
  ///
  /// ```dart
  /// final cities = Table("cities", (blueprint) {
  ///   blueprint.hasOne('country', 'countries', foreignKey: 'countryId');
  /// });
  /// ```
  void hasOne<T>(
    String name,
    String table, {
    required String foreignKey,
    String? localKey,
    RelationAction? onDelete,
    RelationAction? onUpdate,
  }) {
    final relation = HasOne(
      table: table,
      foreignKey: foreignKey,
      localKey: localKey,
      onDelete: onDelete,
      onUpdate: onUpdate,
    );

    this.table.relations.add(relation);
  }

  /// Adds a one-to-many relation to the table.
  ///
  /// ```dart
  /// final countries = Table("countries", (blueprint) {
  ///   blueprint.hasMany('cities', table: "cities", foreignKey: 'countryId');
  /// });
  /// ```
  void hasMany<T>(
    String name,
    String table, {
    required String foreignKey,
    String? localKey,
  }) {
    final relation = HasMany(
      table: table,
      foreignKey: foreignKey,
      localKey: localKey,
    );

    this.table.relations.add(relation);
  }

  /// Adds a many-to-many relation to the table.
  ///
  /// ```dart
  /// final countries = Table("countries", (blueprint) {
  ///   blueprint.belongsToMany('cities', table: "cities", () => countryCities,
  ///      foreignPivotKey: 'countryId', relatedPivotKey: 'cityId');
  /// });
  ///
  /// final countryCities = Table("country_cities", (blueprint) {
  ///   blueprint.int('countryId');
  ///   blueprint.int('cityId');
  ///
  ///   blueprint.primary(['countryId', 'cityId']);
  /// });
  /// ```
  void belongsToMany<T>(
    String name,
    String table,
    String pivotTable, {
    required String foreignPivotKey,
    required String relatedPivotKey,
    String? parentKey,
    String? relatedKey,
  }) {
    final relation = BelongsToMany(
      table: table,
      pivotTable: pivotTable,
      foreignPivotKey: foreignPivotKey,
      relatedPivotKey: relatedPivotKey,
      parentKey: parentKey,
      relatedKey: relatedKey,
    );

    this.table.relations.add(relation);
  }

  /// Adds a many-to-one relation to the table.
  ///
  /// ```dart
  /// final cities = Table("cities", (blueprint) {
  ///   blueprint.belongsTo('country', () => countries, foreignKey: 'countryId');
  /// });
  ///
  /// final countries = Table("countries", (blueprint) {
  ///   blueprint.int('id').primary();
  ///   blueprint.string('name');
  ///   blueprint.hasMany('cities', () => cities, foreignKey: 'countryId');
  /// });
  /// ```
  void belongsTo<T>(
    String name,
    String table, {
    required String foreignKey,
    String? ownerKey,
    RelationAction? onDelete,
    RelationAction? onUpdate,
  }) {
    final relation = BelongsTo(
      table: table,
      foreignKey: foreignKey,
      ownerKey: ownerKey,
      onDelete: onDelete,
      onUpdate: onUpdate,
    );

    this.table.relations.add(relation);
  }
}
