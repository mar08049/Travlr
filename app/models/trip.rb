
class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :places

  default_scope -> { order(id: :asc)}

  def places_attributes=(places_attributes)
    places_attributes.values.each do |places_attributes|
      self.places.build(places_attributes)
    end
  end


  def next
      trips = trip_id_by_name
      trip_index = trips.find_index(id)
      next_trip = trip_index + 1
      if next_trip < trips.length
        trips[next_trip]
      else
        id
      end
    end

    def previous
      trips = trip_id_by_name
      trip_index = trips.find_index(id)
      next_trip = trip_index - 1
      if next_trip < trips.length
        trips[next_trip]
      else
        id
      end
    end

  private

  def trip_id_by_name
    @trip_id ||= Trip.order(name: :asc).pluck(:id)
  end
end
