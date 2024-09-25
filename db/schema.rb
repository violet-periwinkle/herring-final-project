# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_24_205635) do
  create_table "colors", force: :cascade do |t|
    t.string "hex_code"
    t.integer "palette_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proportion"
    t.index ["palette_id"], name: "index_colors_on_palette_id"
  end

  create_table "palettes", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.string "background"
    t.string "layout"
    t.integer "spacing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_palettes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "colors", "palettes"
  add_foreign_key "palettes", "users"
end
