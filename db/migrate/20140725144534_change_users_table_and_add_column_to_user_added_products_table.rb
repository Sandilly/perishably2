class ChangeUsersTableAndAddColumnToUserAddedProductsTable < ActiveRecord::Migration
  def change
    add_column :user_added_products, :notify_by_email, :boolean 
    add_column :user_added_products, :notify_by_text, :boolean 
    remove_column :users, :notify 
  end
end
