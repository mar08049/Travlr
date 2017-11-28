class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :places
  accepts_nested_attributes_for :places
end
