import 'dev/schema/blueprint+relations.dart';
import 'dev/schema/blueprint+scalars.dart';
import 'dev/schema/table.dart';

final countries = Table("countries", (blueprint) {
  blueprint.int("id").primary();
  blueprint.string("name");
  blueprint.hasMany("cities", 'cities',
      foreignKey: "countryId", localKey: "id");
});

final cities = Table("cities", (blueprint) {
  blueprint.int("id").primary();
  blueprint.string("name");
  blueprint.int("countryId", column: 'country_id');
  blueprint.hasOne("country", 'countries',
      foreignKey: "countryId", localKey: "id");
});

// final oh = Oh();

// SQL: SELECT t1.*, t2.* FROM countries ti INNER JOIN cities t2 ON t1.id = t2.country_id
//
// Raw Result: {
//  "countries": { "id": 1, "name": "USA" },
//  "cities": { "id": 1, "name": "New York", "countryId": 1 }
// }
//
// Paesed Result: {
//  "id": 1,
//   "name": "New York",
//   "countryId": 1,
//   "country": {
//     "id": 1,
//     "name": "USA"
//   }
// }
// final query = await oh.select(countries).join(cities, (builder) {
//   builder.on(countries('id') == cities('countryId'));
// }).where(cities['id'] < 10);

void main(List<String> args) {
  print(cities.columns);
}
