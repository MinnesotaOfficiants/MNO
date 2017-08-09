# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170413190256) do

  create_table "email_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "date_sent"
    t.integer  "inquiry_id"
    t.integer  "wedding_id"
    t.integer  "email_template_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "history_id"
    t.string   "history_type"
    t.index ["history_type", "history_id"], name: "index_email_histories_on_history_type_and_history_id", using: :btree
  end

  create_table "email_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.text     "template_content", limit: 65535
    t.string   "template_footer"
    t.string   "template_title"
    t.datetime "created_at",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "template_type"
  end

  create_table "inquiries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "wedding_id"
    t.text     "notes",             limit: 65535
    t.boolean  "contacted_email"
    t.date     "email_sent_date"
    t.boolean  "second_email"
    t.date     "second_email_date"
    t.boolean  "contacted_phone"
    t.boolean  "intro_meeting"
    t.date     "meeting_date"
    t.integer  "user_id"
    t.boolean  "closed"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "phone_call_date"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date     "pmt_date"
    t.decimal  "pmt_amount", precision: 10
    t.string   "pmt_type"
    t.string   "pmt_method"
    t.string   "reference"
    t.integer  "wedding_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "password_hash"
    t.string   "email"
    t.string   "password_salt"
    t.string   "org_password"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "user_phone"
    t.decimal  "user_fee_pct",     precision: 10
    t.string   "calendar_account"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "user_name"
    t.boolean  "active"
  end

  create_table "weddings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "bride_first_name"
    t.string   "bride_last_name"
    t.string   "groom_last_name"
    t.string   "groom_first_name"
    t.string   "bride_email"
    t.string   "groom_email"
    t.string   "bride_phone"
    t.string   "groom_phone"
    t.string   "location"
    t.date     "wedding_date"
    t.time     "wedding_time"
    t.boolean  "rehearsal"
    t.string   "rehearsal_location"
    t.date     "rehearsal_date"
    t.time     "rehearsal_time"
    t.text     "comments",           limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "ceremony_complete"
    t.string   "Ask_for_review"
    t.boolean  "ebook_sent"
    t.boolean  "fee_paid"
    t.decimal  "fee_paid_amount",                  precision: 10
    t.integer  "guest_count"
    t.decimal  "other_cost",                       precision: 10
    t.string   "package"
    t.boolean  "question_complete"
    t.decimal  "referal_fee",                      precision: 10
    t.integer  "request_id"
    t.string   "web_time"
    t.string   "web_count"
    t.string   "web_date"
    t.integer  "user_id"
    t.decimal  "wedding_cost",                     precision: 10
    t.integer  "status"
    t.boolean  "counseling"
    t.string   "first_choice"
    t.string   "second_choice"
    t.string   "third_choice"
    t.integer  "package_type"
    t.date     "fee_paid_date"
  end

end
