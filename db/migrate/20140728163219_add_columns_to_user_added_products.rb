class AddColumnsToUserAddedProducts < ActiveRecord::Migration
  def change
    add_column :user_added_products, :email, :boolean
    add_column :user_added_products, :sms, :boolean
  end
end
