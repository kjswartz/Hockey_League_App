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

ActiveRecord::Schema.define(version: 20150406010826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
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

  create_table "events", force: :cascade do |t|
    t.datetime "start_date"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "stop_date"
    t.integer  "user_id"
    t.string   "description"
  end

  add_index "events", ["team_id"], name: "index_events_on_team_id", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "game_attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_attendances", ["game_id"], name: "index_game_attendances_on_game_id", using: :btree
  add_index "game_attendances", ["user_id"], name: "index_game_attendances_on_user_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "time"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "home_goals",   default: 0
    t.integer  "away_goals",   default: 0
    t.integer  "league_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "games", ["away_team_id"], name: "index_games_on_away_team_id", using: :btree
  add_index "games", ["home_team_id"], name: "index_games_on_home_team_id", using: :btree
  add_index "games", ["league_id"], name: "index_games_on_league_id", using: :btree
  add_index "games", ["loser_id"], name: "index_games_on_loser_id", using: :btree
  add_index "games", ["winner_id"], name: "index_games_on_winner_id", using: :btree

  create_table "leagues", force: :cascade do |t|
    t.string   "skill"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rosters", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "goals",        default: 0
    t.integer  "assists",      default: 0
    t.integer  "penalties",    default: 0
    t.integer  "games_played", default: 0
    t.string   "role"
  end

  add_index "rosters", ["team_id"], name: "index_rosters_on_team_id", using: :btree
  add_index "rosters", ["user_id"], name: "index_rosters_on_user_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedules", ["game_id"], name: "index_schedules_on_game_id", using: :btree
  add_index "schedules", ["team_id"], name: "index_schedules_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",     default: false
    t.string   "owner"
    t.integer  "league_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "win"
    t.integer  "lose"
    t.integer  "tie"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "avatar"
    t.string   "phone"
    t.text     "bio"
    t.boolean  "active",          default: true
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "deleted_at"
  end

  add_foreign_key "events", "teams"
  add_foreign_key "events", "users"
  add_foreign_key "game_attendances", "games"
  add_foreign_key "game_attendances", "users"
  add_foreign_key "games", "leagues"
  add_foreign_key "rosters", "teams"
  add_foreign_key "rosters", "users"
  add_foreign_key "schedules", "games"
  add_foreign_key "schedules", "teams"
  add_foreign_key "teams", "leagues"
end
