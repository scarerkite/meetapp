class Event < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :invitations
  # has_many :users, through: :invitations
  include EventsHelper

  validates :title, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :description, length: { :maximum => 250 }, allow_blank: true

  after_create :set_lat_lng

  def set_lat_lng
    full_address = [self.address, self.postcode].join(", ")
    self.latitude = get_coords(full_address)["lat"]
    self.longitude = get_coords(full_address)["lng"]
    self.save
  end

end
