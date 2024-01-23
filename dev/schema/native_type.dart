import 'dart:convert';

abstract class NativeType<S, T> extends Codec<S, T> {
  const NativeType();

  /// Returns the native type in database type identifier.
  String get identifier;
}
