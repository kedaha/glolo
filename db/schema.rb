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

ActiveRecord::Schema.define(version: 20140614065414) do

  create_table "delivery_locations_posts", force: true do |t|
    t.integer  "post_id",     null: false
    t.integer  "location_id", null: false
    t.integer  "radius"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delivery_locations_posts", ["location_id"], name: "index_delivery_locations_posts_on_location_id", using: :btree
  add_index "delivery_locations_posts", ["post_id"], name: "index_delivery_locations_posts_on_post_id", using: :btree

  create_table "external_accounts", force: true do |t|
    t.integer  "user_id",       null: false
    t.string   "type"
    t.string   "provider"
    t.text     "oauth_token"
    t.text     "refresh_token"
    t.integer  "expires_at"
    t.string   "uid"
    t.string   "username"
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "external_accounts", ["uid"], name: "index_external_accounts_on_uid", using: :btree
  add_index "external_accounts", ["user_id"], name: "index_external_accounts_on_user_id", using: :btree

  create_table "item_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories_items", force: true do |t|
    t.integer  "item_id",          null: false
    t.integer  "item_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_categories_items", ["item_category_id"], name: "index_item_categories_items_on_item_category_id", using: :btree
  add_index "item_categories_items", ["item_id"], name: "index_item_categories_items_on_item_id", using: :btree

  create_table "item_categories_keywords", force: true do |t|
    t.integer  "keyword_id",                   null: false
    t.integer  "item_category_id",             null: false
    t.integer  "strength",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_categories_keywords", ["item_category_id"], name: "index_item_categories_keywords_on_item_category_id", using: :btree
  add_index "item_categories_keywords", ["keyword_id"], name: "index_item_categories_keywords_on_keyword_id", using: :btree

  create_table "item_conditions", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_groups", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_groups_items", force: true do |t|
    t.integer  "item_id",       null: false
    t.integer  "item_group_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_groups_items", ["item_group_id"], name: "index_item_groups_items_on_item_group_id", using: :btree
  add_index "item_groups_items", ["item_id"], name: "index_item_groups_items_on_item_id", using: :btree

  create_table "item_images", force: true do |t|
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "{:null=>false}_file_name"
    t.string   "{:null=>false}_content_type"
    t.integer  "{:null=>false}_file_size"
    t.datetime "{:null=>false}_updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "length"
    t.integer  "width"
    t.integer  "height"
    t.string   "link"
    t.boolean  "pet_free"
    t.string   "why_selling"
    t.string   "any_defects"
    t.integer  "condition_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["condition_id"], name: "index_items_on_condition_id", using: :btree
  add_index "items", ["post_id"], name: "index_items_on_post_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "items_option_values", force: true do |t|
    t.integer  "option_value_id", null: false
    t.integer  "item_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items_option_values", ["item_id"], name: "index_items_option_values_on_item_id", using: :btree
  add_index "items_option_values", ["option_value_id"], name: "index_items_option_values_on_option_value_id", using: :btree

  create_table "keywords", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "cross_street1"
    t.string   "cross_street2"
    t.string   "city"
    t.string   "state"
    t.decimal  "latitude",            precision: 10, scale: 0
    t.decimal  "longitude",           precision: 10, scale: 0
    t.string   "specific_directions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_values", force: true do |t|
    t.integer  "option_type_id", null: false
    t.string   "value",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "option_values", ["option_type_id"], name: "index_option_values_on_option_type_id", using: :btree

  create_table "pickup_locations_posts", force: true do |t|
    t.integer  "post_id",     null: false
    t.integer  "location_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pickup_locations_posts", ["location_id"], name: "index_pickup_locations_posts_on_location_id", using: :btree
  add_index "pickup_locations_posts", ["post_id"], name: "index_pickup_locations_posts_on_post_id", using: :btree

  create_table "post_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "user_id",            null: false
    t.integer  "category_id"
    t.string   "title"
    t.integer  "contact_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "user_contact_profiles", force: true do |t|
    t.string   "phone"
    t.string   "email"
    t.boolean  "frozen",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "screen_name"
    t.integer  "contact_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_locations", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_locations", ["user_id"], name: "index_users_locations_on_user_id", using: :btree

end
