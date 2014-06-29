class UpdateSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :event
  has_one :user
end
