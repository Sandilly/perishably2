class Recipient < ActiveRecord::Base
  has_many :user_added_products, through: :product_recipients
  validates_uniqueness_of :email, :phone_number
  validates_presence_of :email, :phone_number, :name
end