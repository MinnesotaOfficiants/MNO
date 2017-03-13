class AddWeddingFields < ActiveRecord::Migration[5.0]
  def change
    change_table :weddings do |t|
      t.boolean  "Ceremony_complete"
      t.string   "Ask_for_review"
      t.boolean  "ebook_sent"
      t.boolean  "Fee_paid"
      t.decimal  "fee_paid_amount"
      t.integer  "guest_count"
      t.decimal  "other_cost"
      t.string   "package"
      t.boolean  "Question_complete"
      t.decimal  "referal_fee"
      t.integer  "request_id"
      t.string   "web_time"
      t.string   "web_count"
      t.string   "web_date"
      t.integer  "user_id"
      t.decimal  "wedding_cost"
      t.integer  "status"
      t.boolean  "counseling"
      t.string   "first_choice"
      t.string   "second_choice"
      t.string   "third_choice"

    end
  end
end
