class Product < ActiveRecord::Base
  has_many :users, through: :products

  validates :name, presence: true, uniqueness: true
  validates :time, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

#below are methods for the autofill:


end