class RemoveColumnFromUap < ActiveRecord::Migration
  def change
    remove_column :user_added_products, :recipient_id
  end
end
