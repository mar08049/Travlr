class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :places, through: :trips
  has_many :trips
  validates :username, presence: true, uniqueness: true

  def index

  end

  def current_user
    current_user = User.find(params[:id])
  end
end
