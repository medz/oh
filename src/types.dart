abstract interface class Dialect {}

abstract interface class Oh<T extends Dialect> {}

Test<T> defineTable<A extends Dialect, T extends Record>(
    Oh<A>? oh, String name, T defs,
    [void Function(T table)? _]) {
  return Test<T>(defs);
}

final users = defineTable(null, 'users', (id: int,));

extension type const Test<T extends Record>(T $) {}

main() {
  users.$.id;
}
