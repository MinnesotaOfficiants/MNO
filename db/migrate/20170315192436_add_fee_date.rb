class AddFeeDate < ActiveRecord::Migration[5.0]
  def change
     change_table :weddings do |t|
      t.date "fee_paid_date"
    end
  end
end
