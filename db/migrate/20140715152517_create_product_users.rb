class CreateProductUsers < ActiveRecord::Migration
  def change
    create_table :product_users do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :length_of_time
      t.date :exp_date

      t.timestamps
    end
  end
end
