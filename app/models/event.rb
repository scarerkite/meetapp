class Event < ActiveRecord::Base
  belongs_to :user
  has_many :updates
  has_many :invitations
end
