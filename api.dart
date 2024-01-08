import 'dev/src/dialect/postgresql/postgresql.dart';
import 'dev/src/oh.dart';

void main(List<String> args) {
  final oh = Oh<PostgresSQL>(
      // Optional, Not provided disable execute query.
      // url: "postgresql://user:password@localhost:5432/db",
      );

  oh.schema("schema").drop();

  // SELECT * FROM users WHERE id = $1
  //
  // $1 = 1
  oh("users").where((where) => where("id").equals(1));

  // SELECT * FROM users WHERE id = $1 AND name LIKE '%John%' LIMIT 10
  //
  // $1 = 1
  // $2 = %John%
  oh("users")
      .where(
        (where) => where.and([
          (where) => where<int>("id").equals(1),
          (where) => where<String>("name").contains("John"),
        ]),
      )
      .take(10);

  // CREATE TABLE users (id SERIAL PRIMARY KEY, name TEXT NOT NULL)
  oh.createTable("users", (table) {
    table.int("id").primaryKey().autoIncrement();
    table.text("name").notNull();
  });

  // INSERT INTO users (name) VALUES ($1)
  // RETURNING *
  //
  // $1 = "John"
  oh("users").create(
    (into) => [into("name").value("John")],
  );

  // SELECT id, posts, posts.title FROM users
  // JOIN posts ON posts.user_id = users.id
  // WHERE id = $1
  //
  // $1 = 1
  oh("users")
      .select(['id', "posts.id", "posts.title"])
      .where((where) => where("id").equals(1))
      .join("posts", (join) => join("posts.user_id").equals("users.id"));

  // UPDATE users SET name = $1 WHERE id = $2
  //
  // $1 = "John"
  // $2 = 1
  oh("users")
      .where((where) => where("id").equals(1))
      .update((update) => [update("name").value("John")]);
}
