class ChangeColumnInProductUsers < ActiveRecord::Migration
  def change
    
    add_column :product_users, :product_details, :string
    add_column :product_users, :brand, :string
    add_column :product_users, :storage, :string

    remove_column :product_users, :product_id
  end
end
