class Recipient < ActiveRecord::Base
  belongs_to :user_added_product
  validates_presence_of :email, :phone_number, :name
  validates_formatting_of :email, :using => :email
  # validates_uniqueness_of :email
  validates_formatting_of :phone_number, :using => :us_phone
end
