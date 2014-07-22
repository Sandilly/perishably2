class ChangeTimeLengthFormatInProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :number_unit_of_time , :integer
    rename_column :products, :time, :unit_of_time_period
  end
end
