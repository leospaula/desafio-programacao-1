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

ActiveRecord::Schema.define(version: 20161013122733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "description",                          null: false
    t.decimal  "price",       precision: 10, scale: 2, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "purchaser_id"
    t.integer  "item_id"
    t.integer  "merchant_id"
    t.integer  "order_id",                              null: false
    t.integer  "quantity",                              null: false
    t.decimal  "price",        precision: 10, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["item_id"], name: "index_order_items_on_item_id", using: :btree
    t.index ["merchant_id"], name: "index_order_items_on_merchant_id", using: :btree
    t.index ["purchaser_id"], name: "index_order_items_on_purchaser_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "price",      precision: 10, scale: 2,              null: false
    t.integer  "user_id",                                          null: false
    t.string   "filename",                            default: "", null: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "merchants"
  add_foreign_key "order_items", "purchasers"
end
