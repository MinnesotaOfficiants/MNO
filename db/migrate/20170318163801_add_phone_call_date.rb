class AddPhoneCallDate < ActiveRecord::Migration[5.0]
  def change
    change_table :inquiries do |t|
      t.date "phone_call_date"
    end
  end
end
