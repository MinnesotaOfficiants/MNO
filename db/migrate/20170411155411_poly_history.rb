class PolyHistory < ActiveRecord::Migration[5.0]
  def change
  	change_table :email_histories do |t|
  		t.integer :history_id
  		t.string :history_type
  		add_index :email_histories, [ :history_type, :history_id]
  	end
  end
end
