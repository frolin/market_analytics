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

ActiveRecord::Schema[7.0].define(version: 2022_09_04_204942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "slug"
    t.bigint "market_id", null: false
    t.jsonb "data"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_campaigns_on_market_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "imports", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_imports_on_campaign_id"
  end

  create_table "keyword_results", force: :cascade do |t|
    t.bigint "keyword_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_keyword_results_on_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.jsonb "data"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_markets_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "order_costs", force: :cascade do |t|
    t.jsonb "data"
    t.datetime "date"
    t.bigint "order_id", null: false
    t.bigint "import_id", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_order_costs_on_campaign_id"
    t.index ["import_id"], name: "index_order_costs_on_import_id"
    t.index ["order_id"], name: "index_order_costs_on_order_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campaign_id", null: false
    t.index ["campaign_id"], name: "index_order_products_on_campaign_id"
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.jsonb "api_data"
    t.jsonb "excel_data"
    t.datetime "date"
    t.bigint "import_id", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "notified", default: false
    t.string "srid"
    t.string "odid"
    t.index ["campaign_id"], name: "index_orders_on_campaign_id"
    t.index ["import_id"], name: "index_orders_on_import_id"
  end

  create_table "photos", force: :cascade do |t|
    t.jsonb "image_data"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "product_keywords", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "keyword_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_product_keywords_on_keyword_id"
    t.index ["product_id"], name: "index_product_keywords_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.jsonb "data"
    t.string "sku"
    t.string "barcode"
    t.bigint "offer_id"
    t.jsonb "content", default: {}
    t.jsonb "properties", default: {}
    t.jsonb "parameters", default: {}
    t.jsonb "image_data"
    t.jsonb "jsonb"
    t.bigint "campaign_id"
    t.bigint "import_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "cost", default: {}
    t.decimal "price", precision: 8, scale: 2
    t.decimal "purchase_price", precision: 8, scale: 2
    t.index ["campaign_id"], name: "index_products_on_campaign_id"
    t.index ["import_id"], name: "index_products_on_import_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "order_id"
    t.date "date"
    t.jsonb "api_data", default: {}
    t.jsonb "excel_data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.boolean "notified", default: false
    t.bigint "campaign_id"
    t.index ["campaign_id"], name: "index_sales_on_campaign_id"
    t.index ["order_id"], name: "index_sales_on_order_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.jsonb "api_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "suply_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "supply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_suply_products_on_product_id"
    t.index ["supply_id"], name: "index_suply_products_on_supply_id"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id"
    t.bigint "market_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_supplies_on_campaign_id"
    t.index ["market_id"], name: "index_supplies_on_market_id"
    t.index ["user_id"], name: "index_supplies_on_user_id"
  end

  create_table "supply_costs", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.string "operation_type"
    t.jsonb "data"
    t.bigint "supply_product_id", null: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supply_product_id"], name: "index_supply_costs_on_supply_product_id"
  end

  create_table "supply_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "supply_id", null: false
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price", precision: 8, scale: 2
    t.decimal "purchase_price", precision: 8, scale: 2
    t.index ["product_id"], name: "index_supply_products_on_product_id"
    t.index ["supply_id"], name: "index_supply_products_on_supply_id"
  end

  create_table "user_settings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "markets"
  add_foreign_key "keyword_results", "keywords"
  add_foreign_key "markets", "users"
  add_foreign_key "order_costs", "campaigns"
  add_foreign_key "order_costs", "imports"
  add_foreign_key "order_costs", "orders"
  add_foreign_key "order_products", "campaigns"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "campaigns"
  add_foreign_key "orders", "imports"
  add_foreign_key "photos", "products"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_keywords", "keywords"
  add_foreign_key "product_keywords", "products"
  add_foreign_key "products", "users"
  add_foreign_key "sales", "campaigns"
  add_foreign_key "stocks", "products"
  add_foreign_key "supplies", "users"
  add_foreign_key "supply_costs", "supply_products"
  add_foreign_key "supply_products", "products"
  add_foreign_key "supply_products", "supplies"
  add_foreign_key "user_settings", "users"
end
