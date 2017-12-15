require 'pry'
class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :places
  has_many :comments

  def places_attributes=(places_attributes)
    places_attributes.values.each do |places_attributes|
      self.places.build(places_attributes)
    end
  end
end
