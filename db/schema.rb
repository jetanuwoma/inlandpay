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

ActiveRecord::Schema.define(version: 2021_01_24_053717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol", null: false
    t.string "code", null: false
    t.string "hundreds_name", default: "one thousand", null: false
    t.decimal "rate", null: false
    t.string "logo"
    t.integer "default", default: 0, null: false
    t.string "exchange_from", default: "local", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone_number", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", default: "0.0", null: false
    t.string "number"
    t.integer "is_default"
    t.bigint "user_id", null: false
    t.bigint "currency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "metadata"
    t.index ["currency_id"], name: "index_wallets_on_currency_id"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "wallets", "currencies"
  add_foreign_key "wallets", "users"
end
