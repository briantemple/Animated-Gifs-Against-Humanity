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

ActiveRecord::Schema.define(version: 20140101013116) do

  create_table "answers", force: true do |t|
    t.string   "text"
    t.string   "url"
    t.string   "pictureId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers_hands", force: true do |t|
    t.integer "answer_id"
    t.integer "hand_id"
  end

  add_index "answers_hands", ["answer_id", "hand_id"], name: "index_answers_hands_on_answer_id_and_hand_id"
  add_index "answers_hands", ["hand_id"], name: "index_answers_hands_on_hand_id"

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_users", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  add_index "games_users", ["game_id", "user_id"], name: "index_games_users_on_game_id_and_user_id"
  add_index "games_users", ["user_id"], name: "index_games_users_on_user_id"

  create_table "hands", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "round_id"
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "game_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
