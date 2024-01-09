import 'dart:math';

abstract interface class QueryIdentifier {
  /// Returns the query identifier value.
  String get value;

  /// Creates a new [QueryIdentifier].
  factory QueryIdentifier() = _LazyQueryIdentifier;
}

class _LazyQueryIdentifier implements QueryIdentifier {
  String? cache;

  @override
  String get value => cache ??= Random.secure().nextString(8);
}

extension on Random {
  static const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  String nextString(int length) => List.generate(
        length,
        growable: false,
        (index) => chars[nextInt(chars.length)],
      ).join();
}
