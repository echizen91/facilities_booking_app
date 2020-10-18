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

ActiveRecord::Schema.define(version: 2020_10_18_105630) do

  create_table "bookings", force: :cascade do |t|
    t.integer "users_id", null: false
    t.integer "rooms_id", null: false
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rooms_id"], name: "index_bookings_on_rooms_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "location"
    t.string "capacity"
    t.string "classification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bookings", "rooms", column: "rooms_id"
  add_foreign_key "bookings", "users", column: "users_id"
end
