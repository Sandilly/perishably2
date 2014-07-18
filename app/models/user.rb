class User < ActiveRecord::Base
  has_many :product_users
  validates_uniqueness_of :email
  validates_presence_of :email, :name
  has_secure_password

end
