class CreateSignIns < ActiveRecord::Migration
  def change
    create_table :sign_ins do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
