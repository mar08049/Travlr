class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips
  validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password validations: false

  def self.number_of_trips
    self.all.sort_by {|user| user.trips.size * -1}[0]
  end

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash[:info][:email]).first_or_create do |user|
      user.username = auth_hash[:info][:username]
      user.username = auth_hash[:info][:name]
      user.password = SecureRandom.hex
    end
  end

end
