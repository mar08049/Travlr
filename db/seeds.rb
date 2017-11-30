# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Place.create([{
  name: "Madrid",
  memory: "Went to a Real Madrid Game",
  user_id: 3,
  trip_id: 10,
},
{
  name: "Barcelona",
  memory: "Went to the beach",
  user_id: 3,
  trip_id: 10,
},
{
  name: "Gibralter",
  memory: "Hiked to the top!",
  user_id: 3,
  trip_id: 10,
},
{
  name: "Valencia",
  memory: "Ran with the bulls",
  user_id: 3,
  trip_id: 10,
  }])

p "Created #{Place.count} places"
