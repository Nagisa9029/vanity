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

ActiveRecord::Schema.define(version: 20180530164654) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "word"
    t.string "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.text "image_id"
    t.string "category"
  end

  create_table "columnimages", force: :cascade do |t|
    t.text "image_id"
    t.integer "column_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.text "subbody"
    t.index ["column_id"], name: "index_columnimages_on_column_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "c_title"
    t.text "c_body"
    t.string "c_category"
    t.boolean "c_flg"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_columns_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "post_comment"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read_flg"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "commons", force: :cascade do |t|
    t.text "image_id"
    t.string "common_title"
    t.text "common_body"
    t.string "common_category"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_commons_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "contact_name"
    t.text "question"
    t.text "re_question"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read_flg"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gourmetcomments", force: :cascade do |t|
    t.text "g_comment"
    t.integer "user_id"
    t.integer "gourmet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read_flg"
    t.index ["gourmet_id"], name: "index_gourmetcomments_on_gourmet_id"
    t.index ["user_id"], name: "index_gourmetcomments_on_user_id"
  end

  create_table "gourmetfavorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "gourmet_id"
    t.index ["gourmet_id"], name: "index_gourmetfavorites_on_gourmet_id"
    t.index ["user_id"], name: "index_gourmetfavorites_on_user_id"
  end

  create_table "gourmetimages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_id"
    t.integer "gourmet_id"
    t.index ["gourmet_id"], name: "index_gourmetimages_on_gourmet_id"
  end

  create_table "gourmets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "name_kana"
    t.string "category"
    t.date "tel"
    t.string "postal_code"
    t.string "address"
    t.string "street"
    t.string "url"
    t.text "pr"
    t.boolean "g_flg"
    t.integer "user_id"
    t.index ["user_id"], name: "index_gourmets_on_user_id"
  end

  create_table "loves", force: :cascade do |t|
    t.integer "column_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_loves_on_column_id"
    t.index ["user_id"], name: "index_loves_on_user_id"
  end

  create_table "populars", force: :cascade do |t|
    t.integer "gourmet_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gourmet_id"], name: "index_populars_on_gourmet_id"
    t.index ["user_id"], name: "index_populars_on_user_id"
  end

  create_table "postimages", force: :cascade do |t|
    t.text "image_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_postimages_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "p_title"
    t.text "p_body"
    t.string "p_category"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.string "nickname"
    t.string "profile"
    t.boolean "user_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_id"
    t.boolean "bronze"
    t.boolean "silver"
    t.boolean "gold"
    t.boolean "platinum"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
