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

ActiveRecord::Schema[7.1].define(version: 2024_11_29_010217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_batches", force: :cascade do |t|
    t.string "batch_name"
    t.decimal "total_weight"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "current_location"
    t.decimal "capacity"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "pickup_location"
    t.string "dropoff_location"
    t.decimal "weight"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pickup_location_id"
    t.integer "dropoff_location_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "start_location"
    t.string "end_location"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
