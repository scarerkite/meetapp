class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :address, :date
  has_one :user
end
