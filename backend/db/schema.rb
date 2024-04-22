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

ActiveRecord::Schema[7.1].define(version: 2024_04_21_194132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "computer_build_memories", force: :cascade do |t|
    t.bigint "computer_build_id", null: false
    t.bigint "memory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computer_build_id"], name: "index_computer_build_memories_on_computer_build_id"
    t.index ["memory_id"], name: "index_computer_build_memories_on_memory_id"
  end

  create_table "computer_builds", force: :cascade do |t|
    t.bigint "processor_id", null: false
    t.bigint "motherboard_id", null: false
    t.bigint "graphics_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graphics_card_id"], name: "index_computer_builds_on_graphics_card_id"
    t.index ["motherboard_id"], name: "index_computer_builds_on_motherboard_id"
    t.index ["processor_id"], name: "index_computer_builds_on_processor_id"
  end

  create_table "graphics_cards", force: :cascade do |t|
    t.string "name"
    t.integer "memory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memories", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motherboards", force: :cascade do |t|
    t.string "name"
    t.string "supported_processor"
    t.integer "memory_slots"
    t.integer "max_memory"
    t.boolean "integrated_video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.bigint "computer_build_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf", null: false
    t.index ["computer_build_id"], name: "index_orders_on_computer_build_id"
  end

  create_table "processors", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "computer_build_memories", "computer_builds"
  add_foreign_key "computer_build_memories", "memories"
  add_foreign_key "computer_builds", "graphics_cards"
  add_foreign_key "computer_builds", "motherboards"
  add_foreign_key "computer_builds", "processors"
  add_foreign_key "orders", "computer_builds"
end
