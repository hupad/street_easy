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

ActiveRecord::Schema.define(version: 20161117025857) do

  create_table "agents", force: :cascade do |t|
    t.string   "brokerage",      limit: 255
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "middle_initial", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address",     limit: 255
    t.string   "city",        limit: 255
    t.integer  "property_id", limit: 8
    t.string   "state",       limit: 255
    t.string   "unit",        limit: 255
    t.string   "zip_code",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "rating",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "agent_id",   limit: 4
  end

  add_index "reviews", ["agent_id"], name: "index_reviews_on_agent_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.integer  "agent_id",    limit: 4
    t.integer  "price",       limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sales", ["agent_id"], name: "index_sales_on_agent_id", using: :btree
  add_index "sales", ["property_id"], name: "index_sales_on_property_id", using: :btree

  add_foreign_key "reviews", "agents"
  add_foreign_key "sales", "agents"
  add_foreign_key "sales", "properties"
end
