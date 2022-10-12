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

ActiveRecord::Schema.define(version: 2022_10_12_210625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "status"
  end

  create_table "user_properties", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "property_id"
    t.index ["property_id"], name: "index_user_properties_on_property_id"
    t.index ["user_id"], name: "index_user_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "company_domain"
    t.string "email"
    t.string "phone"
  end

  add_foreign_key "user_properties", "properties"
  add_foreign_key "user_properties", "users"
end
