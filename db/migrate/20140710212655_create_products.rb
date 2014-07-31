class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :unit_of_time_period
      t.integer :number_unit_of_time
      t.string :storage
    end
  end
end
