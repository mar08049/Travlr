class Place < ActiveRecord::Base
  belongs_to :users, through: :trips
  belongs_to :trip
end
