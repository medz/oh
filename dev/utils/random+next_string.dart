// ignore_for_file: file_names

import 'dart:math';

extension Random$NextString on Random {
  static const _chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  String nextString(int length) {
    final buf = StringBuffer();
    for (int i = 0; i < length; i++) {
      buf.write(_chars[nextInt(_chars.length)]);
    }

    return buf.toString();
  }
}
