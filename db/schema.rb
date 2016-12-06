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

ActiveRecord::Schema.define(version: 20161205173011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "city",       null: false
    t.string   "state_code", null: false
    t.integer  "zip",        null: false
    t.integer  "latitude",   null: false
    t.integer  "longitude",  null: false
    t.string   "county",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description",  null: false
    t.string   "logo_url"
    t.string   "image_url"
    t.string   "website_url"
    t.string   "facebook_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "event_requirements", force: :cascade do |t|
    t.integer  "event_id",       null: false
    t.integer  "requirement_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "admin_id",    null: false
    t.string   "title",       null: false
    t.float    "lat",         null: false
    t.float    "lng",         null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "event_type"
    t.string   "image_url"
    t.text     "description", null: false
    t.integer  "pay",         null: false
    t.string   "pay_freq",    null: false
    t.date     "start_date",  null: false
    t.date     "end_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.boolean  "accepted",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "requests", ["event_id", "user_id"], name: "index_requests_on_event_id_and_user_id", unique: true, using: :btree

  create_table "requirements", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "icon_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.string   "fname",                           null: false
    t.string   "lname",                           null: false
    t.string   "gender",                          null: false
    t.date     "dob",                             null: false
    t.string   "email",                           null: false
    t.string   "phone_number",                    null: false
    t.text     "about_me"
    t.string   "image_url"
    t.string   "resume_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "company_id"
    t.boolean  "tips_cert",       default: false
    t.boolean  "no_vis_tats",     default: false
    t.boolean  "no_felonies",     default: false
    t.boolean  "valid_dl",        default: false
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
