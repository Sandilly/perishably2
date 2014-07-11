class AddStorageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :storage, :string
  end
end
