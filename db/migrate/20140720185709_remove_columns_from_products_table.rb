class RemoveColumnsFromProductsTable < ActiveRecord::Migration
  def change
    remove_column :products, :brand
    remove_column :products, :nickname
  end
end
