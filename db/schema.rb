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

ActiveRecord::Schema.define(version: 2018_06_10_194342) do

  create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "people_pjs_id", default: 0
    t.bigint "people_pfs_id", default: 0
    t.bigint "accounts_id"
    t.string "name"
    t.boolean "is_child", default: false, null: false
    t.integer "status", default: 0, null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accounts_id"], name: "index_accounts_on_accounts_id"
    t.index ["people_pfs_id"], name: "index_accounts_on_people_pfs_id"
    t.index ["people_pjs_id"], name: "index_accounts_on_people_pjs_id"
  end

  create_table "people_pfs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cpf"
    t.string "full_name"
    t.date "born_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_pjs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cnpj"
    t.string "bussiness_name"
    t.string "fantasy_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "account_id"
    t.integer "category"
    t.decimal "amount", precision: 10, scale: 2, default: "0.0", null: false
    t.string "token"
    t.integer "account_transfer_id"
    t.boolean "reverse", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transfers_on_account_id"
  end

  add_foreign_key "transfers", "accounts"
end
