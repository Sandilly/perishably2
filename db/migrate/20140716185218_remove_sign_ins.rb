class RemoveSignIns < ActiveRecord::Migration
  def change
    drop_table :sign_ins
  end
end
