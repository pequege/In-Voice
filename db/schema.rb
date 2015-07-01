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

ActiveRecord::Schema.define(version: 20150630150703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "organization"
    t.string   "address"
    t.string   "email"
    t.string   "url"
    t.string   "language"
    t.integer  "user_id"
    t.string   "client_lang"
  end

  add_index "clients", ["order_id"], name: "index_clients_on_order_id", using: :btree
  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "details", force: :cascade do |t|
    t.string   "project"
    t.integer  "order_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "task"
    t.string   "description"
    t.decimal  "rate"
    t.decimal  "hour"
    t.decimal  "amount"
    t.decimal  "plus"
  end

  add_index "details", ["order_id"], name: "index_details_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "extra"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "client_id"
    t.string   "other"
    t.integer  "user_id"
    t.decimal  "charge",                    precision: 8, scale: 2
    t.integer  "order_number"
    t.string   "currensy_type"
    t.string   "invoice_file_file_name"
    t.string   "invoice_file_content_type"
    t.integer  "invoice_file_file_size"
    t.datetime "invoice_file_updated_at"
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "min_index"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "clients", "orders"
  add_foreign_key "details", "orders"
end
