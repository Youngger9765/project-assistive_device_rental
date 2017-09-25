class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,:timeoutable
       # :lockable,
       # :confirmable,

end
