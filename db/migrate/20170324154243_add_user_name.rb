class AddUserName < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :user_name
    end
  end
end
