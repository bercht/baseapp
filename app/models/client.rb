class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |client|
      client.email = auth.info.email
      client.name = auth.info.name
      client.password = Devise.friendly_token[0,20]
      client.image = auth.info.image
    end
  end
end
