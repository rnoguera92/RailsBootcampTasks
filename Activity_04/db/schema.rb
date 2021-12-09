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

ActiveRecord::Schema.define(version: 2021_12_09_234319) do

  create_table "people", charset: "utf8mb4", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "nid"
    t.string "phone_number"
    t.string "address"
    t.string "person_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_people_on_deleted_at"
  end

  create_table "people_tags", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "tag_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_people_tags_on_deleted_at"
    t.index ["person_id"], name: "index_people_tags_on_person_id"
    t.index ["tag_id"], name: "index_people_tags_on_tag_id"
  end

  create_table "tag_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_tag_types_on_deleted_at"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_tags_on_deleted_at"
    t.index ["tag_type_id"], name: "index_tags_on_tag_type_id"
  end

  add_foreign_key "tags", "tag_types"
end
