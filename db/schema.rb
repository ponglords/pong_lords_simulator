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

ActiveRecord::Schema.define(version: 20130818213811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.integer  "ranking"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "reached_pro",            default: false
    t.float    "diversity_index_points", default: 0.0
  end

  create_table "results", force: true do |t|
    t.integer  "player_id"
    t.integer  "match_id"
    t.boolean  "won",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doubles_partner_id"
  end

end
