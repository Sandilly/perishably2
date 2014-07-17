class Product < ActiveRecord::Base
  has_many :users
  attr_accessor :nickname
  validates :name, presence: true, uniqueness: true
  validates :time, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end