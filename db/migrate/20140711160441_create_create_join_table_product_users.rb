class CreateCreateJoinTableProductUsers < ActiveRecord::Migration
  def change
    create_table :create_join_table_product_users do |t|
      t.string :user
      t.string :product

      t.timestamps
    end
  end
end
