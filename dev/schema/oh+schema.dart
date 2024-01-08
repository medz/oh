// ignore_for_file: file_names

import '../oh.dart';
import 'schema.dart';

extension Oh$Schema<Database, NotNullName> on Oh<Database> {
  Schema<Database> get schema => Schema();
}
