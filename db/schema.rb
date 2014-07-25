# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140725144534) do

  create_table "emails", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.integer "user_id"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "product_recipients", force: true do |t|
    t.integer "user_added_product_id"
    t.integer "recipient_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "unit_of_time_period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "storage"
    t.string   "number_unit_of_time"
  end

  create_table "recipients", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.integer "phone_number"
  end

  create_table "user_added_products", force: true do |t|
    t.integer  "user_id"
    t.string   "unit_of_time_period"
    t.date     "exp_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_details"
    t.string   "name"
    t.string   "storage"
    t.string   "number_unit_of_time"
    t.date     "notification_date"
    t.boolean  "notify_by_email"
    t.boolean  "notify_by_text"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone_number"
  end

end
