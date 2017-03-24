class CreateEmailHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :email_histories do |t|
      t.date :date_sent
      t.integer :inquiry_id
      t.integer :wedding_id
      t.integer :email_template_id
      t.timestamps
    end
  end
end
