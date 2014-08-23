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

ActiveRecord::Schema.define(version: 20140823182741) do

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
  end

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
