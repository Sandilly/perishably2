class Product < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  # validates :unit_of_time_period, presence: true

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

#below are methods for the autofill:


#above are methods for the autofill

end