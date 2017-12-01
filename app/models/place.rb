class Place < ActiveRecord::Base
  belongs_to :trip

  def self.user_places
    @places = self.Place.all
  end
end
