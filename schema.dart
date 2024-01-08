final schema = defaultSchema((schema) {
  schema.name = 'public';

  schema.model("User", (blueprint) {
    blueprint.int("id").id().autoIncrement();
    blueprint.string("email").unique();
    blueprint.string("name").nullable();
    blueprint.hasOne("profile", "Profile").nullable();
    blueprint.hasMany("posts", "Post");
    blueprint.enum$("role", "Role").defaultTo("USER");
  });

  schema.model("Profile", (blueprint) {
    blueprint.int("id").id().autoIncrement();
    blueprint.string("bio");
    blueprint.belongsTo("user", "User");
  });

  schema.model("Post", (blueprint) {
    blueprint.int("id").id().autoIncrement();
    blueprint.string("title").list();
    blueprint.string("body");
    blueprint.belongsTo('author', 'User');
    blueprint.hasMany('comments', 'Comment');
  });

  schema.model("Comment", (blueprint) {
    blueprint.int("id").id().autoIncrement();
    blueprint.string("body");
    blueprint.belongsTo('post', 'Post');
  });

  schema.enum("Role", (blueprint) {
    blueprint.value("USER");
    blueprint.value("ADMIN", "__admin");
  });
});
