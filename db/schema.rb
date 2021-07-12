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

ActiveRecord::Schema.define(version: 2021_07_12_155810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "status"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "age"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.integer "payment_source_id"
    t.string "status"
    t.string "method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ride_services", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "rider_id"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.decimal "final_latitude"
    t.decimal "final_longitude"
    t.decimal "charge"
    t.boolean "paid_out"
    t.string "status"
    t.decimal "distance_km"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "riders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "status"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "age"
    t.decimal "current_latitude"
    t.decimal "current_longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "token"
    t.string "acceptance_token"
    t.string "payment_method"
    t.integer "payment_method_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "rider_id"
    t.integer "ride_services_id"
    t.string "status"
    t.float "total_amount"
    t.datetime "date"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
