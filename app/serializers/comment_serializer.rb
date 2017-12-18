class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :place_id
end
