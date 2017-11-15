class Place < ActiveRecord::Base
  has_many :users, through: :trips
  has_many :trips
end
