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

ActiveRecord::Schema.define(version: 20140628042248) do

  create_table "behaviors", force: true do |t|
    t.string   "description"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "goal_id"
  end

  add_index "behaviors", ["goal_id"], name: "index_behaviors_on_goal_id"
  add_index "behaviors", ["user_id"], name: "index_behaviors_on_user_id"

  create_table "goals", force: true do |t|
    t.string   "description"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "habits", force: true do |t|
    t.string   "description"
    t.boolean  "done"
    t.string   "interval"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "goal_id"
    t.integer  "streak",      default: 0
  end

  add_index "habits", ["goal_id"], name: "index_habits_on_goal_id"
  add_index "habits", ["user_id"], name: "index_habits_on_user_id"

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.integer  "progress",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "due_date"
    t.integer  "sticky",                      default: 0
    t.string   "due_date_string"
  end

  add_index "tasks", ["goal_id"], name: "index_tasks_on_goal_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "time_zone",              default: "Pacific Time (US & Canada)"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
