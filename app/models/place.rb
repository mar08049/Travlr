class Place < ActiveRecord::Base
  belongs_to :trip

  scope :user_places, -> { order(created_at: :desc)}


end
