class AddNoticationDateToUap < ActiveRecord::Migration
  def change
    add_column :user_added_products, :notification_date, :date
  end
end
