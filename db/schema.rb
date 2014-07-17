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


ActiveRecord::Schema.define(version: 20140716193016) do


  create_table "create_join_table_product_users", force: true do |t|
    t.string   "user"
    t.string   "product"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "length_of_time"
    t.date     "exp_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "storage"
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
