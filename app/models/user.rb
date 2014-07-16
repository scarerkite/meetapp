class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include ActsAsFriendable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :comments
  has_many :invitations, foreign_key: "invitee_id"
  has_many :events, through: :invitations

  has_many :hosted_events, class_name: "Event", foreign_key: "host_id"


  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :bio, length: { :maximum => 250 }, allow_blank: true
  

  has_many :authentications

  mount_uploader :image, ImageUploader

  before_create :set_default_role



  def self.find_for_oauth(kind, auth, signed_in_user=nil)

    case kind
    when "google", "facebook"
      if user = signed_in_user || User.find_by_email(auth.info.email)
        user.name = auth.info.name if user.name.blank?
        user.image = auth.info.image if user.image.blank?
        user.save
      elsif auth_record = Authentication.find_by_provider_and_uid(auth.provider, auth.uid)
        return auth_record.user
      else
        user = User.create do |user|
          user.name = auth.info.name
          user.email = auth.info.email
          user.image = auth.info.image
          user.password = Devise.friendly_token[0,20]
          #user.skip_confirmation! # don't require email confirmation
        end
      end
    end
    if user.persisted?
      user.authentications.where(auth.slice(:provider, :uid)).first_or_create!
    end

    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.google_data"] || session["devise.facebook_data"]
        user.name = auth.info.name if user.name.blank?
        user.email = auth.info.email if user.email.blank?
        user.image = auth.info.image if user.image.blank?
        #user.skip_confirmation! # don't require email confirmation
      end
    end
  end


  def said_yes? event
    invitations.where("event_id= ? AND accepted= 't' ", event.id).empty?
  end

  private
  def set_default_role
    self.role ||= 'user'
  end
end
