class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.integer :wedding_id
      t.text :notes
      t.boolean :contacted_email
      t.date :email_sent_date
      t.boolean :second_email
      t.date :second_email_date
      t.boolean :contacted_phone
      t.date :contacted_phone
      t.boolean :intro_meeting
      t.date :meeting_date
      t.integer :user_id
      t.integer :wedding_id
      t.boolean :closed

      t.timestamps
    end
  end
end
