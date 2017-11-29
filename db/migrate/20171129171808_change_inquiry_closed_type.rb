class ChangeInquiryClosedType < ActiveRecord::Migration[5.0]
  def change
  	change_table :inquiries do |t|
  		t.remove :closed 
  		t.integer :closed
  	end
  end
end
