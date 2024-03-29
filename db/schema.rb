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

ActiveRecord::Schema.define(version: 2021_06_30_152508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "member_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "bank_transactions", force: :cascade do |t|
    t.string "notes"
    t.text "transactions"
    t.string "type", default: "BankTransaction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "member_id"
  end

  create_table "cashes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chit_funds", force: :cascade do |t|
    t.integer "duration"
    t.integer "withdrawn_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "double_entry_transactions", force: :cascade do |t|
    t.date "transaction_date"
    t.integer "credit_account_id"
    t.integer "debit_account_id"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "processed_bank_transaction_id"
    t.integer "member_id"
  end

  create_table "double_entry_transactions_tags", id: false, force: :cascade do |t|
    t.bigint "double_entry_transaction_id", null: false
    t.bigint "tag_id", null: false
    t.index ["double_entry_transaction_id", "tag_id"], name: "transaction_tag_index"
    t.index ["tag_id", "double_entry_transaction_id"], name: "tag_transaction_index"
  end

  create_table "fixed_deposits", force: :cascade do |t|
    t.decimal "maturity_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "golds", force: :cascade do |t|
    t.decimal "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "investments", force: :cascade do |t|
    t.text "notes"
    t.bigint "member_id"
    t.date "bought_on"
    t.date "sold_on"
    t.decimal "buy_value"
    t.decimal "sell_value"
    t.integer "status"
    t.string "investable_type"
    t.string "investable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source"
    t.index ["member_id"], name: "index_investments_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mutual_funds", force: :cascade do |t|
    t.string "product_code"
    t.decimal "units"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "processed_bank_transactions", force: :cascade do |t|
    t.string "uid"
    t.string "narration"
    t.date "transaction_date"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "member_id"
    t.integer "bank_transaction_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "targets", force: :cascade do |t|
    t.integer "member_id"
    t.integer "value"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "uid"
    t.date "transaction_date"
    t.decimal "credit"
    t.decimal "debit"
    t.integer "transaction_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
