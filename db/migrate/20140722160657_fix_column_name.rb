class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :user_added_products, :brand, :name 
  end
end
