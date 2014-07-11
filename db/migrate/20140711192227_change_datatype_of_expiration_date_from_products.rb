class ChangeDatatypeOfExpirationDateFromProducts < ActiveRecord::Migration
  def change
  	change_column(:products, :expiration_date, :string)
  end
end
