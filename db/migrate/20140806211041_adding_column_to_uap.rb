class AddingColumnToUap < ActiveRecord::Migration
  def change
    add_column :user_added_products, :recipient_id, :integer
  end
end
