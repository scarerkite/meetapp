class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :user, :accepted
  has_one :event
end
