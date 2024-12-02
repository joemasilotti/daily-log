# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_02_124116) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alcohol_entries", force: :cascade do |t|
    t.string "name", null: false
    t.date "occurred_on", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_alcohol_entries_on_user_id"
  end

  create_table "caffeine_entries", force: :cascade do |t|
    t.string "name"
    t.date "occurred_on"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_caffeine_entries_on_user_id"
  end

  create_table "exercise_entries", force: :cascade do |t|
    t.string "name", null: false
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_exercise_entries_on_user_id"
  end

  create_table "food_entries", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "out", default: false, null: false
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_food_entries_on_user_id"
  end

  create_table "medication_entries", force: :cascade do |t|
    t.string "name", null: false
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_medication_entries_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "time_zone", default: "Pacific Time (US & Canada)", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "measurement_system", default: "imperial", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "water_entries", force: :cascade do |t|
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.decimal "amount_value", precision: 10, scale: 2
    t.string "amount_unit", limit: 12
    t.index ["user_id"], name: "index_water_entries_on_user_id"
  end

  add_foreign_key "alcohol_entries", "users"
  add_foreign_key "caffeine_entries", "users"
  add_foreign_key "exercise_entries", "users"
  add_foreign_key "food_entries", "users"
  add_foreign_key "medication_entries", "users"
  add_foreign_key "water_entries", "users"
end
