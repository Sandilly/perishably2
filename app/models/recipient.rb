class Recipient < ActiveRecord::Base
  has_many :product_recipients
  has_many :user_added_products, through: :product_recipients
  validates_presence_of :email, :phone_number, :name
  validates_formatting_of :email, :using => :email
  validates_uniqueness_of :email, :phone_number
  validates_formatting_of :phone_number, :using => :us_phone
end