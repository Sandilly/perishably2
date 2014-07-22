class RenameProductUsersTableToUserAddedProducts < ActiveRecord::Migration
  def change
    rename_table :product_users, :user_added_products
  end
end
