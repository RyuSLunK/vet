# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160120193021) do

  create_table "appointments", force: true do |t|
    t.datetime "date_of_visit"
    t.integer  "pet_id"
    t.integer  "customer_id"
    t.boolean  "requires_reminder"
    t.text     "reason_for_visit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id"
  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id"
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appointment_id"
  end

  add_index "customers", ["appointment_id"], name: "index_customers_on_appointment_id"

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "school"
    t.integer  "years_in_practice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "breed"
    t.integer  "age"
    t.integer  "weight"
    t.date     "date_of_last_visit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appointment_id"
  end

  add_index "pets", ["appointment_id"], name: "index_pets_on_appointment_id"

end
