class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :name, presence: true
  has_many :comments, dependent: :destroy 

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
  
  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    User.where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token
      user.expires_at = auth.expires_at
      user.token = auth.token
      user.refresh_token = auth.refresh_token
      user.provider = auth.provider
      user.uid = auth.uid
      user.confirm
      user.name = auth.info.email.split('@').first
    end
  end
end
