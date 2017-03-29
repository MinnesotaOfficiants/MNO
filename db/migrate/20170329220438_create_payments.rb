class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.date :pmt_date
      t.decimal :pmt_amount
      t.string :pmt_type
      t.string :pmt_method
      t.string :reference
      t.integer :wedding_id
      t.timestamps
    end
  end
end
