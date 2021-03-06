# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_21_215235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_histories", force: :cascade do |t|
    t.date "date_sent"
    t.bigint "inquiry_id"
    t.bigint "wedding_id"
    t.bigint "email_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "history_id"
    t.string "history_type", limit: 255
    t.index ["history_type", "history_id"], name: "idx_17824_index_email_histories_on_history_type_and_history_id"
  end

  create_table "email_templates", force: :cascade do |t|
    t.bigint "user_id"
    t.text "template_content"
    t.string "template_footer", limit: 255
    t.string "template_title", limit: 255
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.string "template_type", limit: 255
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "wedding_id"
    t.text "notes"
    t.boolean "contacted_email"
    t.date "email_sent_date"
    t.boolean "second_email"
    t.date "second_email_date"
    t.boolean "contacted_phone"
    t.boolean "intro_meeting"
    t.date "meeting_date"
    t.bigint "user_id"
    t.integer "closed"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.date "phone_call_date"
  end

  create_table "payments", force: :cascade do |t|
    t.date "pmt_date"
    t.decimal "pmt_amount"
    t.string "pmt_type", limit: 255
    t.string "pmt_method", limit: 255
    t.string "reference", limit: 255
    t.bigint "wedding_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", id: :serial, force: :cascade do |t|
    t.string "bride_firstname"
    t.string "bride_lastname"
    t.string "groom_firstname"
    t.string "groom_lastname"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_hash", limit: 255
    t.string "email", limit: 255
    t.string "password_salt", limit: 255
    t.string "org_password", limit: 255
    t.boolean "admin"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "title", limit: 255
    t.string "user_phone", limit: 255
    t.decimal "user_fee_pct", precision: 6, scale: 2
    t.string "calendar_account", limit: 255
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.string "user_name", limit: 255
    t.boolean "active"
  end

  create_table "weddings", force: :cascade do |t|
    t.string "bride_first_name", limit: 255
    t.string "bride_last_name", limit: 255
    t.string "groom_first_name", limit: 255
    t.string "groom_last_name", limit: 255
    t.string "bride_email", limit: 255
    t.string "groom_email", limit: 255
    t.string "bride_phone", limit: 255
    t.string "groom_phone", limit: 255
    t.string "location", limit: 255
    t.date "wedding_date"
    t.time "wedding_time"
    t.boolean "rehearsal"
    t.string "rehearsal_location", limit: 255
    t.date "rehearsal_date"
    t.time "rehearsal_time"
    t.text "comments"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "ceremony_complete"
    t.string "ask_for_review", limit: 255
    t.boolean "no_pref"
    t.boolean "ebook_sent"
    t.boolean "fee_paid"
    t.decimal "fee_paid_amount", precision: 10, scale: 2
    t.bigint "guest_count"
    t.decimal "other_cost", precision: 10
    t.string "package", limit: 255
    t.boolean "question_complete"
    t.decimal "referal_fee", precision: 10, scale: 2
    t.bigint "request_id"
    t.string "web_time", limit: 255
    t.string "web_count", limit: 255
    t.string "web_date", limit: 255
    t.bigint "user_id"
    t.decimal "wedding_cost", precision: 10
    t.bigint "status"
    t.boolean "counseling"
    t.string "first_choice", limit: 255
    t.string "second_choice", limit: 255
    t.string "third_choice", limit: 255
    t.bigint "package_type"
    t.date "fee_paid_date"
    t.string "image_file", limit: 100
  end

end
