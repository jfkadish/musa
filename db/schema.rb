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

ActiveRecord::Schema.define(:version => 20121130193821) do

  create_table "exhibition_works", :force => true do |t|
    t.integer  "exhibition_id"
    t.integer  "works_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "exhibition_works", ["exhibition_id", "works_id"], :name => "index_exhibition_works_on_exhibition_id_and_works_id"

  create_table "exhibitions", :force => true do |t|
    t.string   "exhibition_title"
    t.string   "exhibition_url"
    t.string   "venue"
    t.date     "opening_date"
    t.date     "closing_date"
    t.string   "venue_address"
    t.string   "venue_city"
    t.string   "venue_country"
    t.string   "curator"
    t.string   "curator_email"
    t.string   "curator_phone"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "exhibitions", ["curator"], :name => "index_exhibitions_on_curator"
  add_index "exhibitions", ["exhibition_title"], :name => "index_exhibitions_on_exhibition_title"
  add_index "exhibitions", ["venue"], :name => "index_exhibitions_on_venue"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "works", :force => true do |t|
    t.string   "title"
    t.date     "work_dated"
    t.string   "p_image"
    t.text     "notes"
    t.text     "description"
    t.string   "provenance"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "works", ["title"], :name => "index_works_on_title"

end
