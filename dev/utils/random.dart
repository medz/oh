import 'dart:math';

const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

extension RandomUtils on Random {
  /// Generates a random string of [length] characters.
  String nextString(int length) {
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(_chars[nextInt(_chars.length)]);
    }

    return buffer.toString();
  }
}
