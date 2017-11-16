class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

end
