class AddUserAddedProductIdToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :user_added_product_id, :integer
  end
end
