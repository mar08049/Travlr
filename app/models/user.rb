class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips
  validates :username, presence: true, uniqueness: true


end
