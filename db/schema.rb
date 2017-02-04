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

ActiveRecord::Schema.define(version: 20170204184129) do

  create_table "checkouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkouts_items", force: :cascade do |t|
    t.integer  "checkout_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "checkouts_promotional_rules", force: :cascade do |t|
    t.integer "checkout_id",         null: false
    t.integer "promotional_rule_id", null: false
    t.index ["checkout_id"], name: "index_checkouts_promotional_rules_on_checkout_id"
    t.index ["promotional_rule_id"], name: "index_checkouts_promotional_rules_on_promotional_rule_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "product_code"
    t.integer  "name"
    t.integer  "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "promotional_rules", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "trigger_count"
    t.integer  "trigger_sum"
    t.integer  "reduction_percentage"
    t.integer  "reduction_fixed"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
