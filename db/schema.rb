# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100601204931) do

  create_table "categories", :force => true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compositions", :force => true do |t|
    t.integer  "dish_id"
    t.integer  "ingredient_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "desc"
    t.float    "price"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "crypted_password"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
