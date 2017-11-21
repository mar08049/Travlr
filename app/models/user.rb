class User < ActiveRecord::Base
  has_many :places, through: :trips
  has_many :trips
  validates :username, presence: true, uniqueness: true

  def index

  end

  def current_user
    current_user = User.find(params[:id])
  end
end
