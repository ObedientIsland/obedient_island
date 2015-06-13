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

ActiveRecord::Schema.define(version: 20150613103054) do

  create_table "event_answers", force: :cascade do |t|
    t.string   "answer",        limit: 255
    t.string   "next_type",     limit: 255
    t.integer  "next_id",       limit: 4
    t.integer  "event_part_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "event_answers", ["event_part_id"], name: "index_event_answers_on_event_part_id", using: :btree

  create_table "event_parts", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "text",               limit: 65535
    t.string   "next_type",          limit: 255
    t.integer  "next_id",            limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "event_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "event_parts", ["event_id"], name: "index_event_parts_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.boolean  "active",      limit: 1
    t.integer  "possibility", limit: 4
    t.integer  "scene_id",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "events", ["scene_id"], name: "index_events_on_scene_id", using: :btree

  create_table "scene_connectors", force: :cascade do |t|
    t.integer "position_x",    limit: 4
    t.integer "position_y",    limit: 4
    t.integer "scene_from_id", limit: 4, null: false
    t.integer "scene_to_id",   limit: 4, null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

end
