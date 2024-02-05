/// Database support schema interface tag.
///
/// Implement this interface to support schema extension methods.
abstract interface class SupportSchema {}

/// Database schema fluent.
class Schema<DB> {
  final String name;

  const Schema(this.name);
}
