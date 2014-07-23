class AddPhoneNumberToProductRecipients < ActiveRecord::Migration
  def change
    add_column :product_recipients, :phone_number, :integer
  end
end
