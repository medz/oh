import '../compiler/compiler.dart';
import '../driver/driver.dart';

abstract interface class Dialect {
  /// Creates a new database driver.
  Driver createDriver();

  /// Creates a new compiler.
  Compiler createCompiler();
}
