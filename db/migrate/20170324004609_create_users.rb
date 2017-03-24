class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password_hash
      t.string :email
      t.string :password_salt
      t.string :org_password
      t.boolean :admin
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :user_phone
      t.decimal :user_fee_pct
      t.string :calendar_accouunt
      t.timestamps
    end
  end
end
