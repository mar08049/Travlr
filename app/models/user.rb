class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips
end
