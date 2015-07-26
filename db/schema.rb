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

ActiveRecord::Schema.define(version: 20150723001550) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "typeAddresse", limit: 4,   default: 0
    t.string   "number",       limit: 255,             null: false
    t.string   "street",       limit: 255,             null: false
    t.string   "zipcode",      limit: 255,             null: false
    t.string   "city",         limit: 255,             null: false
    t.string   "country",      limit: 255,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.decimal  "price",                     precision: 10
    t.string   "image_url",   limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "comment",      limit: 65535
    t.integer  "rate",         limit: 4
    t.integer  "ratable_id",   limit: 4
    t.string   "ratable_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
