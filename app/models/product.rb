class Product < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  # validates :unit_of_time_period, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end
end