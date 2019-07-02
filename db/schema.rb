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

ActiveRecord::Schema.define(version: 2019_06_02_170423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buy_prices", force: :cascade do |t|
    t.integer "pennies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cash_account_transactions", force: :cascade do |t|
    t.integer "pennies_withdrawl"
    t.integer "pennies_deposit"
    t.integer "pennies_balance"
    t.bigint "cash_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_account_id"], name: "index_cash_account_transactions_on_cash_account_id"
  end

  create_table "cash_accounts", force: :cascade do |t|
    t.string "cash_account_transaction"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cash_accounts_on_customer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "customers_id"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_id"], name: "index_cities_on_customers_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "mobile"
    t.string "street1"
    t.string "street2"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_customers_on_city_id"
  end

  create_table "financial_instruments", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_financial_instruments_on_customer_id"
  end

  create_table "sell_prices", force: :cascade do |t|
    t.integer "pennies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_sales", force: :cascade do |t|
    t.bigint "stock_id", null: false
    t.bigint "buy_price_id", null: false
    t.bigint "sell_price_id", null: false
    t.integer "shares"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_price_id"], name: "index_stock_sales_on_buy_price_id"
    t.index ["sell_price_id"], name: "index_stock_sales_on_sell_price_id"
    t.index ["stock_id"], name: "index_stock_sales_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.bigint "financial_instrument_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_instrument_id"], name: "index_stocks_on_financial_instrument_id"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string "value"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_zip_codes_on_city_id"
  end

  add_foreign_key "cash_accounts", "customers"
  add_foreign_key "cities", "customers", column: "customers_id"
  add_foreign_key "cities", "states"
  add_foreign_key "financial_instruments", "customers"
  add_foreign_key "stock_sales", "buy_prices"
  add_foreign_key "stock_sales", "sell_prices"
  add_foreign_key "stock_sales", "stocks"
  add_foreign_key "stocks", "financial_instruments"
  add_foreign_key "zip_codes", "cities"
end
