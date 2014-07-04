class Event < ActiveRecord::Base
  include EventsHelper

  belongs_to :host, class_name: "User", foreign_key: "host_id"
  has_many :comments
  has_many :invitations
  has_many :invitees, 
    through: :invitations,
    class_name: "user",
    foreign_key: "invitee_id"
  

  validates :title, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :description, length: { :maximum => 250 }, allow_blank: true

  after_create :set_lat_lng

  accepts_nested_attributes_for :invitations

  def set_lat_lng
    full_address = [self.address, self.postcode].join(", ")
    self.latitude = get_coords(full_address)["lat"]
    self.longitude = get_coords(full_address)["lng"]
    self.save
  end

end
