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

ActiveRecord::Schema[7.1].define(version: 2023_12_06_191045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "water_entries", force: :cascade do |t|
    t.integer "amount", default: 0, null: false
    t.date "occurred_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_water_entries_on_user_id"
  end

  add_foreign_key "exercise_entries", "users"
  add_foreign_key "food_entries", "users"
  add_foreign_key "medication_entries", "users"
  add_foreign_key "water_entries", "users"
end
