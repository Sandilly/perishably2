class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_added_products
  # validates_presence_of :email, :name, :phone_number
  # validates_formatting_of :email, :using => :email
  # validates_uniqueness_of :email, :phone_number
  # validates_formatting_of :phone_number, :using => :us_phone
  # has_secure_password
end
