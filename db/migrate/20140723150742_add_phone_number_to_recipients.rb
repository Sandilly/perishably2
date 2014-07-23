class AddPhoneNumberToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :phone_number, :integer
  end
end
