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

ActiveRecord::Schema.define(version: 20171207212753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_machines", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "brand_id"
    t.string "machinemodel"
    t.string "vin"
    t.string "engine"
    t.string "engineserialnumber"
    t.datetime "datesold"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_customer_machines_on_brand_id"
    t.index ["customer_id"], name: "index_customer_machines_on_customer_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "lastname"
    t.string "name"
    t.integer "title_id"
    t.string "address"
    t.integer "postalcode_id"
    t.string "telephone"
    t.string "mobilephone"
    t.string "fax"
    t.string "email"
    t.string "contact"
    t.string "vatnumber"
    t.string "bankaccount"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postalcode_id"], name: "index_customers_on_postalcode_id"
    t.index ["title_id"], name: "index_customers_on_title_id"
  end

  create_table "machinegroups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", id: :serial, force: :cascade do |t|
    t.integer "machinetype_id"
    t.integer "brand_id"
    t.string "model"
    t.string "engine"
    t.string "description"
    t.decimal "purchaseprice"
    t.decimal "unitprice"
    t.decimal "vatrate"
    t.decimal "currentstock"
    t.decimal "minimalstock"
    t.string "warehouselocation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_machines_on_brand_id"
    t.index ["machinetype_id"], name: "index_machines_on_machinetype_id"
  end

  create_table "machinetypes", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "machinegroup_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machinegroup_id"], name: "index_machinetypes_on_machinegroup_id"
  end

  create_table "postalcodes", id: :serial, force: :cascade do |t|
    t.string "postalcode"
    t.string "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairstates", id: :serial, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "titles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_machines", "brands"
  add_foreign_key "customer_machines", "customers"
  add_foreign_key "customers", "postalcodes"
  add_foreign_key "customers", "titles"
  add_foreign_key "machines", "brands"
  add_foreign_key "machines", "machinetypes"
  add_foreign_key "machinetypes", "machinegroups"
end
