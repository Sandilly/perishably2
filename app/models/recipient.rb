class Recipient < ActiveRecord::Base
  has_many :user_added_products, through: :product_recipients
end