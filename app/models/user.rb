class User < ActiveRecord::Base

  has_many :places, through: :trips
  has_many :trips
  accepts_nested_attributes_for :trips
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password validations: false

  def index

  end


end
