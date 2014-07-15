class Product < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :expiration_date, presence: true

end