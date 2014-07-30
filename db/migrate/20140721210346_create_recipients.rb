class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.integer :user_added_product_id
    end
  end
end
