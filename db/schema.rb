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

ActiveRecord::Schema.define(version: 20151214234327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string "name"
  end

  create_table "lifts", force: :cascade do |t|
    t.integer "seshion_id"
    t.integer "exercise_id"
  end

  add_index "lifts", ["exercise_id"], name: "index_lifts_on_exercise_id", using: :btree
  add_index "lifts", ["seshion_id"], name: "index_lifts_on_seshion_id", using: :btree

  create_table "seshions", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "user_id"
    t.datetime "date"
  end

  add_index "seshions", ["date"], name: "index_seshions_on_date", using: :btree
  add_index "seshions", ["user_id"], name: "index_seshions_on_user_id", using: :btree
  add_index "seshions", ["workout_id"], name: "index_seshions_on_workout_id", using: :btree

  create_table "sets", force: :cascade do |t|
    t.integer  "lift_id"
    t.integer  "reps"
    t.float    "weight"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "sets", ["lift_id"], name: "index_sets_on_lift_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workout_exercises", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "target_sets"
    t.integer "target_reps"
  end

  add_index "workout_exercises", ["exercise_id"], name: "index_workout_exercises_on_exercise_id", using: :btree
  add_index "workout_exercises", ["workout_id"], name: "index_workout_exercises_on_workout_id", using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

end
