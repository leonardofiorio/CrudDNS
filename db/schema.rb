# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_13_205822) do

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "type_domain"
    t.string "ttl"
    t.string "primary_name_server"
    t.string "contact"
    t.string "refresh"
    t.string "retry"
    t.string "expire"
    t.string "minimum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "is_contained_id"
    t.index ["is_contained_id"], name: "index_domains_on_is_contained_id"
  end

end
