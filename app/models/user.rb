class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,:timeoutable,
       :confirmable
       # :lockable,


  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end
end
