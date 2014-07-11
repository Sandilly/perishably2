class Product < ActiveRecord::Base
  has_many :users
end