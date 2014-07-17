class AddColumnsToProductsPage < ActiveRecord::Migration
  def change
    add_column :products, :nickname, :string
    add_column :products, :brand, :string
  end
end
