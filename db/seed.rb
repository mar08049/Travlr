Trip.destroy_all

Trip.create([{
  name: "Asia",
  year: "2016",
},
{
  name: "Africa",
  year: "2014",
},
{
  name: "France",
  year: "2010",
}])

p "Created #{Trips.count} trips"
