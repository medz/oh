// ignore_for_file: file_names

import 'dart:typed_data';

import 'package:decimal/decimal.dart';

import 'blueprint.dart';
import 'column.dart';
import 'column_builder.dart';
import 'native_type.dart';

typedef _Int = int;
typedef _Double = double;
typedef _Bool = bool;

extension Blueprint$Scalars on Blueprint {
  /// Creates a int column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.int('id').primary();
  /// });
  /// ```
  ///
  // ignore: library_private_types_in_public_api
  ColumnBuilder<_Int, T> int<T>(
    String name, {
    String? column,
    // ignore: library_private_types_in_public_api
    NativeType<_Int, T>? type,
  }) =>
      createColumnBuilder<_Int, T>(name, column: column, type: type);

  /// Creates a double column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.double('id').primary();
  /// });
  /// ```
  ///
  // ignore: library_private_types_in_public_api
  ColumnBuilder<_Double, T> double<T>(
    String name, {
    String? column,
    // ignore: library_private_types_in_public_api
    NativeType<_Double, T>? type,
  }) =>
      createColumnBuilder<_Double, T>(name, column: column, type: type);

  /// Creates a string column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.string('name').nullable();
  /// });
  /// ```
  ColumnBuilder<String, T> string<T>(String name,
          {String? column, NativeType<String, T>? type}) =>
      createColumnBuilder<String, T>(name, column: column, type: type);

  /// Creates a bool column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.bool('is_active').nullable();
  /// });
  /// ```
  ///
  // ignore: library_private_types_in_public_api
  ColumnBuilder<_Bool, T> bool<T>(
    String name, {
    String? column,
    // ignore: library_private_types_in_public_api
    NativeType<_Bool, T>? type,
  }) =>
      createColumnBuilder<_Bool, T>(name, column: column, type: type);

  /// Creates a datetime column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.datetime('created_at').nullable();
  /// });
  /// ```
  ColumnBuilder<DateTime, T> datetime<T>(String name,
          {String? column, NativeType<DateTime, T>? type}) =>
      createColumnBuilder<DateTime, T>(name, column: column, type: type);

  /// Creates a bytes column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///     blueprint.bytes('avatar').nullable();
  /// });
  /// ```
  ColumnBuilder<Uint8List, T> bytes<T>(String name,
          {String? column, NativeType<Uint8List, T>? type}) =>
      createColumnBuilder<Uint8List, T>(name, column: column, type: type);

  /// Creates a json column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.json('settings').nullable();
  /// });
  /// ```
  ColumnBuilder<dynamic, T> json<T>(String name,
          {String? column, NativeType<dynamic, T>? type}) =>
      createColumnBuilder<dynamic, T>(name, column: column, type: type);

  /// Creates a decimal column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.decimal('price').nullable();
  /// });
  /// ```
  ColumnBuilder<Decimal, T> decimal<T>(String name,
          {String? column, NativeType<Decimal, T>? type}) =>
      createColumnBuilder<Decimal, T>(name, column: column, type: type);

  /// Creates a unsupported column.
  ///
  /// ```dart
  /// final table = Table('users', (blueprint) {
  ///   blueprint.unsupported('custom', type: const Arez());
  /// });
  /// ```
  ColumnBuilder<S, T> unsupported<S, T>(String name, NativeType<S, T> type,
          {String? column}) =>
      createColumnBuilder<S, T>(name, column: column, type: type);
}

extension on Blueprint {
  ColumnBuilder<S, T> createColumnBuilder<S, T>(String name,
      {String? column, NativeType<S, T>? type}) {
    final value = Column<S, T>(name, table, column: column, type: type);
    table.columns.add(value);

    return ColumnBuilder<S, T>(table, name);
  }
}
