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

ActiveRecord::Schema.define(version: 20151210175309) do

  create_table "events", force: :cascade do |t|
    t.integer  "reporter_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "type"
    t.boolean  "broadcast",   default: false, null: false
  end

  add_index "events", ["reporter_id"], name: "index_events_on_reporter_id"

  create_table "reporters", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "uuid"
    t.integer  "interval",       default: 1
    t.string   "interval_units", default: "days"
    t.string   "timezone",       default: "Pacific Time (US & Canada)"
  end

  add_index "reporters", ["user_id"], name: "index_reporters_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.integer  "reporter_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "type"
    t.integer  "attempts",    default: 0
    t.boolean  "processing",  default: false
  end

  add_index "tasks", ["reporter_id"], name: "index_tasks_on_reporter_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "timezone",               default: "Pacific Time (US & Canada)"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
