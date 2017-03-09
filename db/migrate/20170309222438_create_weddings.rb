class CreateWeddings < ActiveRecord::Migration[5.0]
  def change
    create_table :weddings do |t|
      t.string :bride_first_name
      t.string :bride_last_name
      t.string :groom_last_name
      t.string :groom_first_name
      t.string :bride_email
      t.string :groom_email
      t.string :bride_phone
      t.string :groom_phone
      t.string :location
      t.date :wedding_date
      t.time :wedding_time
      t.boolean :rehearsal
      t.string :rehearsal_location
      t.date :rehearsal_date
      t.time :rehearsal_time
      t.text :comments
      t.timestamps
    end
  end
end
