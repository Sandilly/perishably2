class ChangeTimeLengthFormat < ActiveRecord::Migration
  def change
    add_column :user_added_products, :number_unit_of_time , :integer
    rename_column :user_added_products, :length_of_time, :unit_of_time_period
  end
end
