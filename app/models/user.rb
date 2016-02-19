class User < ActiveRecord::Base
  # Include default devise modules. Available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, presence: true
  validates :first_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]
    has_many :workspaces
    has_many :bookings

  has_attachment :picture

  acts_as_messageable

  GENDERS = ["Femme", "Homme"]

  # after_create :send_welcome_email

  # after_create :subscribe_to_newsletter

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def mailboxer_email(object)
    email
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  private

  def subscribe_to_newsletter
    SubscribeToNewsletter.new(self).run
  end

end
