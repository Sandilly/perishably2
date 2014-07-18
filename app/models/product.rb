class Product < ActiveRecord::Base
  

  validates :name, presence: true, uniqueness: true
  validates :time, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end