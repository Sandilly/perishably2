class ChangeDataType < ActiveRecord::Migration
  def change
    change_column(:user_added_products, :number_unit_of_time, :string)
    change_column(:products, :number_unit_of_time, :string)
  end
end
