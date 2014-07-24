class ProductRecipient < ActiveRecord::Base
  belongs_to :user_added_product
  belongs_to :recipient
end