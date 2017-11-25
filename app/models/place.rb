class Place < ActiveRecord::Base
  has_many :users, through: :trips
  belongs_to :trip
end
