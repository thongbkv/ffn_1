class User < ActiveRecord::Base
  has_many :comments
  has_many :replies
  has_many :bets
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_many :comments
  has_many :replies
  has_many :bets
  enum role: [:admin, :member]

  after_save :send_email

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  private
  def send_email
    @admin = User.find_by role: 0
    UserNotifier.send_admin_email(@admin, self).deliver_now
  end
end
