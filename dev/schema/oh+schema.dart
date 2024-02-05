// ignore_for_file: file_names

import '../oh.dart';
import 'schema.dart';

extension Oh$Schema<DB extends SupportSchema> on Oh<DB> {
  /// Database schema fluent.
  ///
  /// Example:
  ///
  /// ```dart
  /// oh.schema('auth').create();
  ///
  /// oh.schema('auth').create((schema) {
  ///   schema.ifNotExists();
  /// });
  ///
  /// oh.schema('auth').drop();
  ///
  /// oh.schema('auth').drop((schema) {
  ///   schema.ifExists();
  /// });
  Schema<DB> schema(String name) => Schema(name);
}
