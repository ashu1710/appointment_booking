# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_02_085406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_doctor_times", force: :cascade do |t|
    t.date "custom_availabe_date"
    t.string "from_time"
    t.string "to_time"
    t.boolean "no_available", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_available_doctor_times_on_user_id"
  end

  create_table "booking_appointments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.date "booking_date"
    t.string "from_time"
    t.string "to_time"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_doctor", default: false
    t.string "hospital_name"
    t.string "hospital_address"
    t.string "hospital_mobile_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "available_doctor_times", "users"
end
