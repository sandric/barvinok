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

ActiveRecord::Schema.define(version: 20160320181906) do

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
  end

  create_table "comments", force: :cascade do |t|
    t.text    "data"
    t.integer "talk_id"
    t.integer "user_id"
    t.index ["talk_id"], name: "index_comments_on_talk_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "commits", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "keyboard_id"
    t.text    "description"
    t.index ["keyboard_id"], name: "index_commits_on_keyboard_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "keyboards", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "user_id"
    t.index ["user_id"], name: "index_keyboards_on_user_id"
  end

  create_table "layers", force: :cascade do |t|
    t.string  "name"
    t.string  "color"
    t.integer "vid"
    t.text    "layout"
    t.integer "commit_id"
    t.index ["commit_id"], name: "index_layers_on_commit_id"
  end

  create_table "talks", force: :cascade do |t|
    t.text    "data"
    t.string  "title"
    t.integer "keyboard_id"
    t.integer "user_id"
    t.index ["keyboard_id"], name: "index_talks_on_keyboard_id"
    t.index ["user_id"], name: "index_talks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
