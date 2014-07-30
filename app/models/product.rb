class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end
