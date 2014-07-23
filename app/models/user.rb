class User < ActiveRecord::Base
  has_many :user_added_products
  has_many :friends

  validates_uniqueness_of :email
  validates_presence_of :email, :name
  has_secure_password
end
