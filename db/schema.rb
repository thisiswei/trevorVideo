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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130120001712) do

  create_table "favorites", :force => true do |t|
    t.integer   "person_id"
    t.integer   "video_id"
    t.timestamp "created_at"
  end

  create_table "people", :force => true do |t|
    t.string    "youtube_username"
    t.string    "vimeo_username"
    t.string    "name"
    t.timestamp "created_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "key"
    t.string   "title"
    t.string   "source"
    t.integer  "first_person_id"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.integer  "played",          :limit => 255
    t.integer  "likes",           :limit => 255
    t.string   "user_name"
    t.text     "data"
  end

end
