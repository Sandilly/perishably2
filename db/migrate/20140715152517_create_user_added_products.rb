class CreateUserAddedProducts < ActiveRecord::Migration
  def change
    create_table :user_added_products do |t|
      t.string :name
      t.integer :user_id
      t.date :exp_date
      t.string :product_details
      t.string :number_unit_of_time #do we need this column?
      t.string :unit_of_time_period #do we need this column?
      t.date :notification_date
      t.boolean :notify #Do we need this column?
      t.boolean :email
      t.boolean :sms
      t.boolean :string
      t.string :storage

      t.timestamps
    end
  end
end
