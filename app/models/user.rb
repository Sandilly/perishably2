class User < ActiveRecord::Base
  has_many :products
  validates_uniqueness_of :email
  has_secure_password

end
