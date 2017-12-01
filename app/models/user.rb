class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips
  accepts_nested_attributes_for :trips
  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password validations: false

  def self.number_of_trips
    self.trips.count
  end

end
