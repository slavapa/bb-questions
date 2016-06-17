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

ActiveRecord::Schema.define(version: 20160422094012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_setup_types", force: :cascade do |t|
    t.string   "name",        limit: 60, null: false
    t.string   "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "application_setups", force: :cascade do |t|
    t.integer  "app_setup_type_id", null: false
    t.integer  "language_id"
    t.string   "code_id",           null: false
    t.string   "description"
    t.string   "str_value",         null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "application_setups", ["app_setup_type_id"], name: "index_application_setups_on_app_setup_type_id", using: :btree
  add_index "application_setups", ["language_id", "code_id"], name: "index_application_setups_language_id_code_id", unique: true, using: :btree
  add_index "application_setups", ["language_id"], name: "index_application_setups_on_language_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 60,                 null: false
    t.string   "code",       limit: 5,                  null: false
    t.boolean  "is_rtl",                default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "languages", ["code"], name: "index_languages_on_code", using: :btree
  add_index "languages", ["name", "code"], name: "index_languages_name_code", unique: true, using: :btree
  add_index "languages", ["name"], name: "index_languages_on_name", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.string   "from"
    t.string   "ip"
    t.boolean  "banned"
    t.boolean  "selected"
    t.boolean  "approved"
    t.integer  "sequence"
    t.text     "question",    null: false
    t.text     "translation"
    t.text     "reformed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["from"], name: "index_questions_on_from", using: :btree
  add_index "questions", ["name"], name: "index_questions_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 60,                  null: false
    t.string   "family_name",     limit: 60
    t.string   "email",           limit: 255
    t.boolean  "admin",                       default: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["family_name"], name: "index_users_on_family_name", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree

  add_foreign_key "application_setups", "app_setup_types"
  add_foreign_key "application_setups", "languages"
end
