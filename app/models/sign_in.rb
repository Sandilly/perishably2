class SignIn < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :phone_number
  validates_uniqueness_of :email
end
