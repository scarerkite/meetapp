class Event < ActiveRecord::Base
  include EventsHelper
  #include ActiveModel::Validations
  #require "uk_postcode"
  geocoded_by :full_address
  before_create :geocode
  after_validation :geocode,
    :if => lambda{ |obj| obj.address_changed? }

  def full_address
    [self.address, self.postcode].join(", ")
  end

  reverse_geocoded_by :latitude, :longitude 

  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.address  = [geo.street_number, geo.route, geo.city].join(", ")
      obj.postcode = geo.postal_code
    end
  end
  after_validation :reverse_geocode,
    :if => lambda{ |obj| obj.longitude_changed? }

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

  accepts_nested_attributes_for :invitations


  

end
