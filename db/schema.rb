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

ActiveRecord::Schema.define(version: 2020_08_11_203919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "address", null: false
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_intents", force: :cascade do |t|
    t.string "client_secret", null: false
    # FEEDBACK: is better to use cents so there's no floating point rounding error. Stripe and a lot of services use cents also, so there is less need to translate
    t.decimal "amount", null: false
    t.string "payment_method_type"
    t.string "receipt_email"
    t.bigint "client_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "payment_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_payment_intents_on_client_id"
    t.index ["currency_id"], name: "index_payment_intents_on_currency_id"
    t.index ["payment_status_id"], name: "index_payment_intents_on_payment_status_id"
  end

  create_table "payment_statuses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "client_secret", null: false
    # FEEDBACK: is better to use cents so there's no floating point rounding error. Stripe and a lot of services use cents also, so there is less need to translate
    t.decimal "amount", null: false
    t.string "receipt_email", null: false
    t.datetime "cancelled_at"
    t.string "cancellation_reason"
    t.bigint "payment_intent_id", null: false
    t.bigint "client_id", null: false
    t.bigint "currency_id", null: false
    t.bigint "payment_status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["currency_id"], name: "index_payments_on_currency_id"
    t.index ["payment_intent_id"], name: "index_payments_on_payment_intent_id"
    t.index ["payment_status_id"], name: "index_payments_on_payment_status_id"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.integer "quantity", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "description"
    t.decimal "price", null: false
    t.string "image"
    t.boolean "is_enabled", default: true
    t.bigint "currency_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "stock_movement_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stock_movements", force: :cascade do |t|
    t.bigint "stock_movement_type_id", null: false
    t.bigint "client_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_stock_movements_on_product_id"
  end

  add_foreign_key "payment_intents", "clients"
  add_foreign_key "payment_intents", "currencies"
  add_foreign_key "payment_intents", "payment_statuses"
  add_foreign_key "payments", "clients"
  add_foreign_key "payments", "currencies"
  add_foreign_key "payments", "payment_intents"
  add_foreign_key "payments", "payment_statuses"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "currencies"
  add_foreign_key "stock_movements", "clients"
  add_foreign_key "stock_movements", "products"
  add_foreign_key "stock_movements", "stock_movement_types"
end
