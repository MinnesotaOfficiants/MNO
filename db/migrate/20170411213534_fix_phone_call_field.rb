class FixPhoneCallField < ActiveRecord::Migration[5.0]
  def change
  	change_column(:inquiries,  :contacted_phone ,  :boolean)
  	
  end
end
