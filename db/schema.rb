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

ActiveRecord::Schema.define(version: 20140826052358) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "politician_id"
    t.string   "category"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["politician_id"], name: "index_notifications_on_politician_id", using: :btree

  create_table "politicians", force: true do |t|
    t.string   "api_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "nickname"
    t.string   "party"
    t.text     "bio"
    t.text     "job_title"
    t.string   "candidate_number"
    t.string   "candidate_title"
    t.string   "age"
    t.string   "cpf"
    t.string   "scholarity"
    t.string   "house"
    t.string   "state"
    t.string   "title"
    t.text     "past_jobs"
    t.text     "past_parties"
    t.string   "uri"
  end

  add_index "politicians", ["api_id"], name: "index_politicians_on_api_id", using: :btree
  add_index "politicians", ["uri"], name: "index_politicians_on_uri", using: :btree

  create_table "politicians_users", force: true do |t|
    t.integer "user_id"
    t.integer "politician_id"
  end

  add_index "politicians_users", ["politician_id"], name: "index_politicians_users_on_politician_id", using: :btree
  add_index "politicians_users", ["user_id"], name: "index_politicians_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
