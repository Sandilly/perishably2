class ChangeProducts < ActiveRecord::Migration
  def change
    change_column :products, :expiration_date, :integer  
  end
end
