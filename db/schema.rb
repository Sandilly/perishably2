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

ActiveRecord::Schema.define(version: 20140721210346) do

  create_table "product_recipients", force: true do |t|
    t.integer "user_added_product_id"
    t.integer "recipient_id"
  end

  create_table "products", force: true do |t|
    t.string  "name"
    t.string  "unit_of_time_period"
    t.integer "number_unit_of_time"
    t.string  "storage"
  end

  create_table "recipients", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "phone_number"
    t.integer "user_added_product_id"
  end

  create_table "user_added_products", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "exp_date"
    t.string   "product_details"
    t.string   "number_unit_of_time"
    t.string   "unit_of_time_period"
    t.date     "notification_date"
    t.boolean  "notify"
    t.boolean  "email"
    t.boolean  "sms"
    t.boolean  "string"
    t.string   "storage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
