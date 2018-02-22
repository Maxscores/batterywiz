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

ActiveRecord::Schema.define(version: 20180221221744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appliances", force: :cascade do |t|
    t.string "name"
    t.integer "avg_monthly_kwh"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_appliances_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "consumptions", force: :cascade do |t|
    t.bigint "installation_id"
    t.string "jan"
    t.string "feb"
    t.string "mar"
    t.string "apr"
    t.string "may"
    t.string "jun"
    t.string "jul"
    t.string "aug"
    t.string "sep"
    t.string "oct"
    t.string "nov"
    t.string "dec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["installation_id"], name: "index_consumptions_on_installation_id"
  end

  create_table "installations", force: :cascade do |t|
    t.text "zipcode"
    t.decimal "utility_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solar_systems", force: :cascade do |t|
    t.bigint "installation_id"
    t.decimal "capacity"
    t.integer "module_type"
    t.integer "losses"
    t.integer "array_type"
    t.integer "tilt"
    t.integer "azimuth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["installation_id"], name: "index_solar_systems_on_installation_id"
  end

  add_foreign_key "appliances", "categories"
  add_foreign_key "consumptions", "installations"
  add_foreign_key "solar_systems", "installations"
end
