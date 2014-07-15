class ChangeColumnNameInProductsTable < ActiveRecord::Migration
  def change
  	rename_column(:products, :expiration_date, :time)
  end
end
