class TripSerializer
  def self.serialize(trip)

    # start with the open brace to create a valid JSON object
    serialized_trip = '{'

    serialized_trip += '"id": ' + trip.id.to_s + ', '
    serialized_trip += '"name": "' + trip.name + '", '




    # and end with the close brace
    serialized_trip += '}'
  end
end
