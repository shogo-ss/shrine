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

ActiveRecord::Schema.define(version: 2020_01_14_010304) do

  create_table "concerns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shrine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shrine_id"], name: "index_concerns_on_shrine_id"
    t.index ["user_id", "shrine_id"], name: "index_concerns_on_user_id_and_shrine_id", unique: true
    t.index ["user_id"], name: "index_concerns_on_user_id"
  end

  create_table "pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_pictures_on_review_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "comment"
    t.bigint "evaluation"
    t.bigint "user_id"
    t.bigint "shrine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shrine_id"], name: "index_reviews_on_shrine_id"
    t.index ["user_id", "shrine_id"], name: "index_reviews_on_user_id_and_shrine_id", unique: true
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shrines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_shrines_on_name", unique: true
    t.index ["prefecture_id"], name: "index_shrines_on_prefecture_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
  end

  add_foreign_key "concerns", "shrines"
  add_foreign_key "concerns", "users"
  add_foreign_key "pictures", "reviews"
  add_foreign_key "reviews", "shrines"
  add_foreign_key "reviews", "users"
  add_foreign_key "shrines", "prefectures"
end
