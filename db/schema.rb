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

ActiveRecord::Schema.define(:version => 20130124024830) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "social"
    t.string   "web"
    t.string   "type"
    t.integer  "note_id"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "editions", :force => true do |t|
    t.integer  "work_id"
    t.integer  "owner_id"
    t.integer  "edition_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "exhibition_venues", :force => true do |t|
    t.integer  "exhibition_id"
    t.date     "opening_date"
    t.date     "closing_date"
    t.integer  "venue_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "venue_id"
    t.text     "description"
    t.integer  "contact_id"
    t.integer  "note_id"
    t.boolean  "group_show"
  end

  add_index "exhibitions", ["curator"], :name => "index_exhibitions_on_curator"
  add_index "exhibitions", ["exhibition_title"], :name => "index_exhibitions_on_exhibition_title"
  add_index "exhibitions", ["venue"], :name => "index_exhibitions_on_venue"

  create_table "files", :force => true do |t|
    t.string   "type"
    t.string   "file_name"
    t.integer  "contact_id"
    t.integer  "file_number"
    t.integer  "note_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "files", ["file_name"], :name => "index_files_on_file_name", :unique => true

  create_table "notes", :force => true do |t|
    t.text     "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "provenances", :force => true do |t|
    t.integer  "work_id"
    t.integer  "owner_id"
    t.date     "date_acquired"
    t.date     "date_transfered"
    t.integer  "note_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "references", :force => true do |t|
    t.integer  "work_id"
    t.integer  "contact_id"
    t.text     "reference"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "venues", :force => true do |t|
    t.string   "venue_name"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.integer  "note_id"
    t.integer  "owner_id"
    t.string   "media_type"
    t.string   "height"
    t.string   "width"
    t.string   "dimention_notes"
    t.string   "inventory_number"
    t.string   "bin"
    t.string   "signed"
    t.string   "tags"
    t.string   "condition"
    t.string   "estate_number"
    t.string   "mckee_number"
    t.string   "status"
    t.string   "is_edition"
    t.string   "inscription"
  end

  add_index "works", ["title"], :name => "index_works_on_title"

end
