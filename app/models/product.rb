class Product < ActiveRecord::Base
  has_many :users, through: :product_users

  validates :name, presence: true, uniqueness: true
  validates :time, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end