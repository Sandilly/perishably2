class ProductRecipient < ActiveRecord::Base
  belongs_to :user_added_products
  belongs_to :recipients
end