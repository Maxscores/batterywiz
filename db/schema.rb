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

ActiveRecord::Schema.define(version: 20180226222216) do

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

  create_table "basic_utility_rates", force: :cascade do |t|
    t.decimal "residential"
    t.decimal "commercial"
    t.decimal "industrial"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode"], name: "index_basic_utility_rates_on_zipcode"
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
    t.bigint "user_id"
    t.decimal "battery_capacity"
    t.index ["user_id"], name: "index_installations_on_user_id"
  end

  create_table "monthly_solar_outputs", force: :cascade do |t|
    t.string "zipcode"
    t.decimal "jan"
    t.decimal "feb"
    t.decimal "mar"
    t.decimal "apr"
    t.decimal "may"
    t.decimal "jun"
    t.decimal "jul"
    t.decimal "aug"
    t.decimal "sep"
    t.decimal "oct"
    t.decimal "nov"
    t.decimal "dec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zipcode"], name: "index_monthly_solar_outputs_on_zipcode"
  end

  create_table "productions", force: :cascade do |t|
    t.bigint "installation_id"
    t.string "station"
    t.string "station_city"
    t.string "station_state"
    t.decimal "ac_jan"
    t.decimal "ac_feb"
    t.decimal "ac_mar"
    t.decimal "ac_apr"
    t.decimal "ac_may"
    t.decimal "ac_jun"
    t.decimal "ac_jul"
    t.decimal "ac_aug"
    t.decimal "ac_sep"
    t.decimal "ac_oct"
    t.decimal "ac_nov"
    t.decimal "ac_dec"
    t.decimal "dc_jan"
    t.decimal "dc_feb"
    t.decimal "dc_mar"
    t.decimal "dc_apr"
    t.decimal "dc_may"
    t.decimal "dc_jun"
    t.decimal "dc_jul"
    t.decimal "dc_aug"
    t.decimal "dc_sep"
    t.decimal "dc_oct"
    t.decimal "dc_nov"
    t.decimal "dc_dec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["installation_id"], name: "index_productions_on_installation_id"
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

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appliances", "categories"
  add_foreign_key "consumptions", "installations"
  add_foreign_key "productions", "installations"
  add_foreign_key "solar_systems", "installations"
end
