# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Place.create([{
  name: "Cambodia",
  memory: "Ate bananas",
  user_id: 3,
  trip_id: 8,
},
{
  name: "Thailand",
  memory: "Went to the beach",
  user_id: 3,
  trip_id: 8,
},
{
  name: "Myanmar",
  memory: "Road a hot air baloon",
  user_id: 3,
  trip_id: 8
}])

p "Created #{Place.count} places"
