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

ActiveRecord::Schema.define(version: 2019_11_22_135559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.string "type_domain"
    t.string "ttl"
    t.string "primary_name_server"
    t.string "contact"
    t.integer "refresh"
    t.integer "retry"
    t.integer "expire"
    t.integer "minimum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "domains_id"
    t.index ["domains_id"], name: "index_domains_on_domains_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "type_record"
    t.string "name"
    t.string "ttl"
    t.string "class_record"
    t.string "content"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "domain_id"
    t.index ["domain_id"], name: "index_records_on_domain_id"
  end

  add_foreign_key "domains", "domains", column: "domains_id", on_delete: :cascade
  add_foreign_key "records", "domains", on_delete: :cascade
end
