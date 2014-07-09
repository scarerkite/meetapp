class Event < ActiveRecord::Base
  include EventsHelper
  #include ActiveModel::Validations
  #require "uk_postcode"

  # reverse_geocoded_by :latitude, :longitude do |obj, results|
  #   if geo = results.first
  #     # populate your model
  #     obj.city    = geo.city
  #     obj.zipcode = geo.postal_code
  #     obj.country = geo.country_code
  #   end
  # end
  # before_update :reverse_geocode, if: :longitude_changed?

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
  validates :date, presence: true
  validates :time, presence: true
  # validate do |:postcode|
  #   postcode.postcode_valid?
  # end

  after_create :set_lat_lng

  # before_save :update_address
  # before_update :update_address

  accepts_nested_attributes_for :invitations


  # def postcode_valid?
  #   pc = UKPostcode.new(self.postcode)
  #   errors.add(:base, 'Postcode must be valid') unless pc.valid?
  # end


  def update_address
    set_lat_lng if self.address_changed? || self.postcode_changed?
  end


  def set_lat_lng
    full_address = [self.address, self.postcode].join(", ")
    self.latitude = get_coords(full_address)["lat"]
    self.longitude = get_coords(full_address)["lng"]
    self.save
  end

  # Bing
  # def set_lat_lng
  #   full_address = [self.address, self.postcode].join(", ")
  #   self.latitude = get_coords(full_address).first
  #   self.longitude = get_coords(full_address).last
  #   self.save
  # end

end
