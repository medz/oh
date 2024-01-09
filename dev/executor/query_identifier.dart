import 'dart:math';

import '../utils/random.dart';

abstract interface class QueryIdentifier {
  /// The unique identifier for this query.
  String get value;

  /// Creates a new [QueryIdentifier].
  factory QueryIdentifier() => _LazyQueryIdentifier();
}

/// Lazily generates a unique identifier for a query.
class _LazyQueryIdentifier implements QueryIdentifier {
  String? _value;

  @override
  String get value => _value ??= Random.secure().nextString(16);
}
