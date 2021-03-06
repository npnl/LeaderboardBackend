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

ActiveRecord::Schema.define(version: 2019_12_02_040210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_code"
    t.datetime "deleted_at"
  end

  create_table "reset_passwords", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "requested_at"
    t.string "reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reset_passwords_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["group_id"], name: "index_subjects_on_group_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.decimal "score"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.bigint "group_id"
    t.boolean "admin", default: false
    t.datetime "deleted_at"
    t.index ["group_id"], name: "index_users_on_group_id"
  end

  add_foreign_key "reset_passwords", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "subjects", "groups"
  add_foreign_key "submissions", "users"
  add_foreign_key "users", "groups"
end
