class CreateJoinTableProductRecipients < ActiveRecord::Migration
  def change
    create_table :product_recipients do |t|
      t.integer :user_added_product_id
      t.integer :recipient_id
    end
  end
end
