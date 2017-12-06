class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :bride_firstname
      t.string :bride_lastname
      t.string :groom_firstname
      t.string :groom_lastname
      t.string :location
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
