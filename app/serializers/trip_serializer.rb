class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :user_id
  has_many :places

end
