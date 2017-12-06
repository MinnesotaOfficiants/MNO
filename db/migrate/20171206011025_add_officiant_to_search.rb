class AddOfficiantToSearch < ActiveRecord::Migration[5.0]
  def change
  	change_table :searches do |t|
  		t.integer "user_id"
  	end
  end
end
