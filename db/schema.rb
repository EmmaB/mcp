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

ActiveRecord::Schema.define(version: 20130130180634263) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.date "due_date"
    t.string "activity_type", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "deal_id"
  end

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "address_one", limit: 255
    t.string "address_two", limit: 255
    t.string "address_three", limit: 255
    t.string "address_four", limit: 255
    t.string "postcode", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "address_type", limit: 255
    t.boolean "set_as_default_address"
    t.string "address_description", limit: 255
    t.string "organisation_name"
    t.string "department_name"
    t.string "post_office_box"
    t.string "sub_building"
    t.string "building"
    t.string "care_of"
    t.text "api_address"
    t.text "api_response"
    t.datetime "api_response_as_of"
    t.index ["client_id"], name: "index_addresses_on_client_id"
    t.index ["contact_id"], name: "index_addresses_on_contributor_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "advances", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.float "advance_value"
    t.integer "tax_rate"
    t.string "trigger", limit: 255
    t.date "paid_date"
    t.integer "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contract_id"
    t.integer "client_id"
    t.integer "user_id"
    t.date "due_date"
    t.index ["book_id"], name: "index_advances_on_book_id"
    t.index ["client_id"], name: "index_advances_on_client_id"
    t.index ["contact_id"], name: "index_advances_on_contributor_id"
    t.index ["contract_id"], name: "index_advances_on_contract_id"
    t.index ["user_id"], name: "index_advances_on_user_id"
  end

  create_table "advisories", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "advisable_type", limit: 255
    t.integer "advisable_id"
    t.string "advice_type", limit: 255
    t.text "advice"
    t.datetime "created_at"
    t.index ["advisable_id", "advisable_type", "advice_type"], name: "index_advisories_type_id"
  end

  create_table "age_range_codes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proprietary_age_range_id"
  end

  create_table "ai_archives", id: :serial, force: :cascade do |t|
    t.string "pdf_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_id"
    t.string "text_for_praise_for_heading", limit: 255
  end

  create_table "ai_templates", id: :serial, force: :cascade do |t|
    t.string "image_file_name", limit: 255
    t.string "header", limit: 255
    t.string "footer", limit: 255
    t.integer "contact_id"
    t.string "about", limit: 255
    t.string "blurb", limit: 255
    t.string "related", limit: 255
    t.string "biblio", limit: 255
    t.string "author", limit: 255
    t.integer "distributor_id"
    t.integer "sales_id"
    t.integer "marketing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "user_id"
    t.string "design_name", limit: 255
    t.string "template_name", limit: 255
    t.string "text_color", limit: 255
    t.string "other_color", limit: 255
    t.boolean "default"
    t.string "page_size", limit: 255
    t.integer "work_id"
    t.string "text_for_praise_for_heading", limit: 255
    t.text "uses_text_types", array: true
  end

  create_table "altcontacts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contact_id"
    t.string "name_type", limit: 255
    t.string "titles_before_names", limit: 255
    t.string "names_before_key", limit: 255
    t.string "keynames", limit: 255
    t.string "corporate_name", limit: 255
    t.string "keyname_prefix", limit: 255
    t.string "name_after_keyname", limit: 255
    t.string "suffix_after_keyname", limit: 255
    t.string "qualification_after_keyname", limit: 255
    t.string "titles_after_names", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_altcontacts_on_client_id"
    t.index ["contact_id"], name: "index_altcontacts_on_contact_id"
    t.index ["user_id"], name: "index_altcontacts_on_user_id"
  end

  create_table "amazon_ecs_requests", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.text "response"
    t.text "publisher"
    t.string "response_group"
    t.string "country"
    t.string "type"
    t.string "api_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "created_at"], name: "index_amazon_ecs_requests_on_client_id_and_created_at"
  end

  create_table "amazontitles", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "isbn", limit: 255
    t.string "title", limit: 255
    t.string "edition_statement", limit: 255
    t.string "pub_date", limit: 255
    t.string "publisher", limit: 255
    t.string "product_form_description", limit: 255
    t.string "author", limit: 255
    t.string "extent_value", limit: 255
    t.string "image_url", limit: 255
    t.string "resource_link", limit: 255
    t.string "measurement", limit: 255
    t.decimal "price_amount"
    t.string "currency_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.string "format_description", limit: 255
    t.string "default_price_amount", limit: 255
    t.string "country", limit: 255
    t.string "height"
    t.string "width"
    t.string "weight"
    t.string "length"
    t.string "eisbn"
    t.string "genre"
    t.string "part"
    t.string "language"
    t.string "material"
    t.string "region"
    t.string "summary"
    t.text "response_xml"
    t.index ["book_id"], name: "index_amazontitles_on_book_id"
    t.index ["client_id"], name: "index_amazontitles_on_client_id"
    t.index ["user_id"], name: "index_amazontitles_on_user_id"
  end

  create_table "ancillary_contents", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "ancillary_content_containable_id"
    t.string "ancillary_content_containable_type", limit: 255
    t.string "ancillary_content_type_code", limit: 3
    t.string "description", limit: 255
    t.integer "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ancillary_content_type_id", null: false
    t.index ["ancillary_content_containable_id", "ancillary_content_containable_type"], name: "index_ancillary_contents_containable"
    t.index ["ancillary_content_type_code"], name: "index_ancillary_contents_on_ancillary_content_type_code"
    t.index ["client_id", "ancillary_content_type_id"], name: "index_ancillary_contents_client_ancillary_content_type"
  end

  create_table "announcements", id: :serial, force: :cascade do |t|
    t.text "message"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "any_files", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "data_source"
    t.string "attachment_class"
    t.text "attachment_file_name"
    t.integer "attachment_file_size"
    t.string "attachment_fingerprint"
    t.datetime "created_at"
    t.integer "status", default: 0
    t.text "processing_errors", default: [], array: true
    t.index ["client_id", "attachment_class"], name: "index_any_files_on_client_id_and_attachment_class"
  end

  create_table "api_keys", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "key"
  end

  create_table "audience_ranges", id: :serial, force: :cascade do |t|
    t.string "audience_range_qualifier", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.string "audience_range_precision_one", limit: 255
    t.string "audience_range_value_one", limit: 255
    t.string "audience_range_precision_two", limit: 255
    t.string "audience_range_value_two", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audiences", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "audience_code_type", limit: 255
    t.string "audience_code_value", limit: 255
    t.integer "book_id"
    t.integer "work_id"
    t.index ["book_id"], name: "index_audiences_on_book_id"
    t.index ["client_id"], name: "index_audiences_on_client_id"
    t.index ["user_id"], name: "index_audiences_on_user_id"
    t.index ["work_id"], name: "index_audiences_on_work_id"
  end

  create_table "backup_contract_work_id", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "work_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "termination_reason", limit: 255
    t.string "contract_type", limit: 255
    t.string "signatory", limit: 255
    t.string "contract_name", limit: 255
    t.string "territory", limit: 255
    t.string "free_copies", limit: 255
    t.string "copyright_year", limit: 255
    t.string "type", limit: 255
    t.string "reserve", limit: 255
    t.string "author_discount", limit: 255
    t.string "remainder_rate", limit: 255
    t.string "cross_accounting", limit: 255
    t.string "free_copies_used", limit: 255
    t.string "statement_frequency", limit: 255
    t.string "term", limit: 255
    t.string "royalty_basis", limit: 255
    t.date "renewal_date"
    t.date "terminated_date"
    t.date "pub_before_date"
    t.date "signed_date"
    t.date "ms_delivery_date"
    t.date "ms_proofs_date"
    t.date "review_date"
    t.date "first_statement_date"
    t.integer "contracttemplate_id"
    t.integer "client_id"
    t.date "last_statement_date"
    t.decimal "guaranteed_royalty_value"
    t.float "flat_fee_value"
    t.integer "contractset_id"
    t.integer "owner"
    t.boolean "add_all_contributors_to_work_to_contract"
    t.date "next_statement"
    t.text "description"
    t.integer "statement_sales_lag_months"
    t.integer "statement_min_book_sale_months"
    t.integer "strategic_importance"
    t.decimal "remainder_rate_over_cost"
  end

  create_table "barcodeimgs", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.string "image_file_size", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "work_id"
    t.index ["book_id"], name: "index_barcodeimgs_on_book_id"
    t.index ["client_id"], name: "index_barcodeimgs_on_client_id"
    t.index ["user_id"], name: "index_barcodeimgs_on_user_id"
  end

  create_table "batch_message_levels", id: :serial, force: :cascade do |t|
    t.integer "level", null: false
    t.string "name", limit: 255, null: false
  end

  create_table "batch_message_templates", id: :serial, force: :cascade do |t|
    t.integer "batch_message_level_id", null: false
    t.string "batch_type", limit: 255, null: false
    t.string "batch_code", limit: 255, null: false
    t.string "message", limit: 255, null: false
    t.text "explanation"
  end

  create_table "batch_messages", id: :serial, force: :cascade do |t|
    t.integer "batch_messageable_id"
    t.string "batch_messageable_type", limit: 255
    t.integer "batch_message_level_id", null: false
    t.string "particulars", limit: 255
    t.string "link", limit: 255
    t.boolean "ignore", default: false, null: false
    t.index ["batch_messageable_id", "batch_messageable_type"], name: "index_batch_messages_messageable"
  end

  create_table "bic_codes", primary_key: "code", id: :string, limit: 255, force: :cascade do |t|
    t.string "value", limit: 255, null: false
    t.index ["value"], name: "unq_bic_codes_value", unique: true
  end

  create_table "bicgeogsubjects", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "work_id"
    t.index ["book_id"], name: "index_bicgeogsubjects_on_book_id"
    t.index ["client_id"], name: "index_bicgeogsubjects_on_client_id"
    t.index ["user_id"], name: "index_bicgeogsubjects_on_user_id"
    t.index ["work_id"], name: "index_bicgeogsubjects_on_work_id"
  end

  create_table "bicsubjects", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_id", null: false
    t.index ["code", "work_id"], name: "index_bicsubjects_on_code_and_work_id", unique: true
    t.index ["user_id"], name: "index_bicsubjects_on_user_id"
    t.index ["work_id", "code"], name: "index_bicsubjects_on_work_id_and_code", unique: true
  end

  create_table "binding_types", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "bisacsubjects", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "work_id"
    t.index ["book_id"], name: "index_bisacsubjects_on_book_id"
    t.index ["client_id"], name: "index_bisacsubjects_on_client_id"
    t.index ["user_id"], name: "index_bisacsubjects_on_user_id"
    t.index ["work_id"], name: "index_bisacsubjects_on_work_id"
  end

  create_table "book_amazon_asins", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "book_id", null: false
    t.string "asin", null: false
    t.string "marketplace", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["book_id", "marketplace"], name: "index_book_amazon_asins_on_book_id_and_marketplace", unique: true
  end

  create_table "book_audience_ranges", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "audience_range_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "audience_range_id"], name: "index_book_audience_ranges_on_book_id_and_audience_range_id"
  end

  create_table "book_briefs", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "brief_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "brief_id"], name: "index_book_briefs_on_book_id_and_brief_id"
  end

  create_table "book_channel_forecasts", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.integer "channel_id", null: false
    t.integer "print_qty"
    t.decimal "price"
    t.decimal "net_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_channel_forecasts_on_book_id"
  end

  create_table "book_channels", id: :serial, force: :cascade do |t|
    t.integer "book_masterchannel_id", null: false
    t.integer "channel_id", null: false
    t.integer "client_id", null: false
    t.date "earliest_invoice_date"
    t.date "latest_invoice_date"
    t.integer "total_sale_quantity", default: 0, null: false
    t.decimal "total_sale_value", default: "0.0", null: false
    t.integer "total_sale_records", default: 0, null: false
    t.integer "total_excluded_quantity", default: 0, null: false
    t.decimal "total_excluded_value", default: "0.0", null: false
    t.integer "total_excluded_records", default: 0, null: false
    t.integer "total_royaltied_quantity", default: 0, null: false
    t.decimal "total_royaltied_value", default: "0.0", null: false
    t.integer "total_royaltied_records", default: 0, null: false
    t.decimal "total_royalty_value", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "royalty_rate"
    t.integer "user_id"
    t.datetime "royalty_specifier_changed_at"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.index ["book_masterchannel_id", "channel_id"], name: "index_book_channels_on_book_masterchannel_id_and_channel_id", unique: true
    t.index ["monthly_sale_profile_id"], name: "index_book_channels_on_monthly_sale_profile_id"
    t.index ["returns_monthly_profile_id"], name: "index_book_channels_on_returns_monthly_profile_id"
  end

  create_table "book_collection_items", id: :serial, force: :cascade do |t|
    t.string "item_name", limit: 255
    t.string "item_value", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_limited_suppliers", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "book_id", null: false
    t.integer "supplier_id", null: false
    t.index ["book_id", "supplier_id"], name: "index_book_limited_suppliers_on_book_id_and_supplier_id"
    t.index ["supplier_id", "book_id"], name: "index_book_limited_suppliers_on_supplier_id_and_book_id"
  end

  create_table "book_masterchannels", id: :serial, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "masterchannel_id", null: false
    t.integer "client_id", null: false
    t.date "earliest_invoice_date"
    t.date "latest_invoice_date"
    t.integer "total_sale_quantity", default: 0, null: false
    t.decimal "total_sale_value", default: "0.0", null: false
    t.integer "total_sale_records", default: 0, null: false
    t.integer "total_excluded_quantity", default: 0, null: false
    t.decimal "total_excluded_value", default: "0.0", null: false
    t.integer "total_excluded_records", default: 0, null: false
    t.integer "total_royaltied_quantity", default: 0, null: false
    t.decimal "total_royaltied_value", default: "0.0", null: false
    t.integer "total_royaltied_records", default: 0, null: false
    t.decimal "total_royalty_value", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "royalty_specifier_changed_at"
    t.index ["book_id", "masterchannel_id"], name: "index_book_masterchannels_on_book_id_and_masterchannel_id", unique: true
    t.index ["masterchannel_id"], name: "index_book_masterchannels_on_masterchannel_id"
  end

  create_table "book_print_binding_details", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_binding_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_print_binding_details_on_book_id"
    t.index ["print_binding_detail_id"], name: "index_book_print_binding_details_on_print_binding_detail_id"
  end

  create_table "book_print_cover_details", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_cover_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_cover_detail_id"
    t.index ["book_id"], name: "index_book_print_cover_details_on_book_id"
    t.index ["print_cover_detail_id"], name: "index_book_print_cover_details_on_print_cover_detail_id"
  end

  create_table "book_print_originations", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_origination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_print_originations_on_book_id"
    t.index ["print_origination_id"], name: "index_book_print_originations_on_print_origination_id"
  end

  create_table "book_print_paper_details", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_paper_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_print_paper_details_on_book_id"
    t.index ["print_paper_detail_id"], name: "index_book_print_paper_details_on_print_paper_detail_id"
  end

  create_table "book_print_parts", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_print_parts_on_book_id"
    t.index ["print_part_id"], name: "index_book_print_parts_on_print_part_id"
  end

  create_table "book_print_print_parts", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "print_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_print_print_parts_on_book_id"
    t.index ["print_part_id"], name: "index_book_print_print_parts_on_print_part_id"
  end

  create_table "book_prizes", id: :serial, force: :cascade do |t|
    t.integer "prize_id"
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["book_id", "prize_id"], name: "index_book_prizes_on_book_id_and_prize_id"
    t.index ["prize_id", "book_id"], name: "index_book_prizes_on_prize_id_and_book_id", unique: true
  end

  create_table "book_production_files", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "production_file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_production_files_on_book_id"
    t.index ["production_file_id"], name: "index_book_production_files_on_production_file_id"
  end

  create_table "book_reprints", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "reprint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_reprints_on_book_id"
    t.index ["reprint_id"], name: "index_book_reprints_on_reprint_id"
  end

  create_table "book_schedules", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_schedules_on_book_id"
    t.index ["schedule_id"], name: "index_book_schedules_on_schedule_id"
  end

  create_table "book_scratchpads", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "scratchpad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_scratchpads_on_book_id"
    t.index ["scratchpad_id"], name: "index_book_scratchpads_on_scratchpad_id"
  end

  create_table "book_seriesnames", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "seriesname_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_within_series"
    t.string "year_of_annual", limit: 255
    t.index ["book_id"], name: "index_book_seriesnames_on_book_id"
    t.index ["seriesname_id"], name: "index_book_seriesnames_on_seriesname_id"
  end

  create_table "book_shops", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "book_id", null: false
    t.integer "shop_id", null: false
    t.date "from_date"
    t.date "to_date"
    t.index ["book_id", "shop_id"], name: "index_book_shops_on_book_id_and_shop_id", unique: true
    t.index ["client_id"], name: "index_book_shops_on_client_id"
    t.index ["shop_id", "book_id"], name: "index_book_shops_on_shop_id_and_book_id", unique: true
  end

  create_table "book_simple_print_prices", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "simple_print_price_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_supplier_configs", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "supplier_config_id", null: false
    t.integer "book_id", null: false
    t.date "expected_availability_date"
    t.date "consumer_sales_embargo_date"
    t.index ["book_id", "supplier_config_id"], name: "index_book_supplier_configs_on_book_id_and_supplier_config_id"
    t.index ["supplier_config_id", "book_id"], name: "index_book_supplier_configs_on_supplier_config_id_and_book_id"
  end

  create_table "book_tests", id: :serial, force: :cascade do |t|
    t.integer "book_validation_template_id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "validation_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "result"
    t.datetime "date_result_logged"
  end

  create_table "book_unnamed_people", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "work_unnamed_person_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_validation_reports", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "validation_template_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_validation_templates", id: :serial, force: :cascade do |t|
    t.integer "validation_template_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "user_id"
    t.string "status", limit: 255
    t.date "date_last_passing"
    t.index ["book_id"], name: "index_book_validation_templates_on_book_id"
    t.index ["validation_template_id"], name: "index_book_validation_templates_on_validation_template_id"
  end

  create_table "book_validation_tests", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "result"
    t.integer "validation_test_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "eligible"
    t.index ["book_id", "validation_test_id", "result"], name: "index_book_validation_tests_1"
    t.index ["client_id"], name: "index_book_validation_tests_on_client_id"
    t.index ["validation_test_id"], name: "index_book_validation_tests_on_validation_test_id"
  end

  create_table "bookaudiences", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "audience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["audience_id"], name: "index_bookaudiences_on_audience_id"
    t.index ["book_id"], name: "index_bookaudiences_on_book_id"
    t.index ["client_id"], name: "index_bookaudiences_on_client_id"
    t.index ["user_id"], name: "index_bookaudiences_on_user_id"
  end

  create_table "bookbicgeogsubjects", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "bicgeogsubject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bicgeogsubject_id"], name: "index_bookbicgeogsubjects_on_bicgeogsubject_id"
    t.index ["book_id"], name: "index_bookbicgeogsubjects_on_book_id"
    t.index ["client_id"], name: "index_bookbicgeogsubjects_on_client_id"
    t.index ["user_id"], name: "index_bookbicgeogsubjects_on_user_id"
  end

  create_table "bookbicsubjects", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "bicsubject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id", null: false
    t.index ["bicsubject_id", "book_id"], name: "index_bookbicsubjects_on_bicsubject_id_and_book_id", unique: true
    t.index ["bicsubject_id"], name: "index_bookbicsubjects_on_bicsubject_id"
    t.index ["book_id", "bicsubject_id"], name: "index_bookbicsubjects_on_book_id_and_bicsubject_id", unique: true
    t.index ["book_id"], name: "index_bookbicsubjects_on_book_id"
    t.index ["user_id"], name: "index_bookbicsubjects_on_user_id"
  end

  create_table "bookbisacsubjects", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "bisacsubject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["bisacsubject_id"], name: "index_bookbisacsubjects_on_bisacsubject_id"
    t.index ["book_id"], name: "index_bookbisacsubjects_on_book_id"
    t.index ["client_id"], name: "index_bookbisacsubjects_on_client_id"
    t.index ["user_id"], name: "index_bookbisacsubjects_on_user_id"
  end

  create_table "bookcontacts", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.integer "book_id"
    t.string "sequence_number", limit: 255
    t.string "contributor_role", limit: 255
    t.integer "client_id"
    t.integer "workcontact_id"
    t.integer "work_id"
    t.index ["book_id"], name: "index_bookcontacts_on_book_id"
    t.index ["client_id"], name: "index_bookcontacts_on_client_id"
    t.index ["contact_id"], name: "index_bookcontacts_on_contributor_id"
    t.index ["work_id"], name: "index_bookcontacts_on_work_id"
    t.index ["workcontact_id"], name: "index_bookcontacts_on_workcontact_id"
  end

  create_table "bookmarketingtexts", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "marketingtext_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "work_id"
    t.index ["book_id"], name: "index_bookmarketingtexts_on_book_id"
    t.index ["marketingtext_id"], name: "index_bookmarketingtexts_on_marketingtext_id"
    t.index ["work_id"], name: "index_bookmarketingtexts_on_work_id"
  end

  create_table "bookmarks", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.text "visit_page"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "set_as_homepage"
    t.index ["client_id"], name: "index_bookmarks_on_client_id"
  end

  create_table "bookprints", id: :serial, force: :cascade do |t|
    t.integer "print_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "foreignright_id"
    t.integer "received_quantity"
    t.index ["book_id", "print_id"], name: "index_bookprints_on_book_id_and_print_id"
    t.index ["print_id", "book_id"], name: "index_bookprints_on_print_id_and_book_id"
  end

  create_table "bookprints_nonuniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "print_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "quantity"
    t.integer "foreignright_id"
  end

  create_table "bookprints_uniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "print_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "quantity"
    t.integer "foreignright_id"
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "notification", limit: 255
    t.string "isbn", limit: 255
    t.string "prefix", limit: 255
    t.string "title", limit: 255
    t.string "subtitle", limit: 255
    t.integer "edition"
    t.string "edition_statement", limit: 255
    t.string "imprint", limit: 255
    t.string "publisher_role", limit: 255
    t.string "publisher", limit: 255
    t.string "publication_city", limit: 255
    t.string "publication_country", limit: 255
    t.string "publishing_status", limit: 255
    t.integer "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "default_price_amount", limit: 255
    t.string "default_price_currency", limit: 255
    t.string "default_contributor_first_name", limit: 255
    t.string "default_contributor_last_name", limit: 255
    t.date "pub_date"
    t.boolean "include_on_web", default: false, null: false
    t.integer "client_id"
    t.boolean "highlight_on_web"
    t.text "contributor_statement"
    t.integer "user_id"
    t.string "format_detail", limit: 255
    t.string "format_description", limit: 255
    t.string "part_number", limit: 255
    t.string "annual_year", limit: 255
    t.string "illustrations_note", limit: 255
    t.string "illustrated", limit: 255
    t.integer "number_of_illustrations"
    t.integer "series_id"
    t.date "onixsent"
    t.string "google_preview", limit: 255
    t.string "google_info", limit: 255
    t.float "high_discount_threshold"
    t.boolean "exclude_from_royalty_calc", default: false
    t.integer "owner"
    t.float "micron"
    t.date "cover_ftped_date"
    t.integer "altcontact_id"
    t.integer "format_id"
    t.integer "format_detail_id"
    t.boolean "valid_onix"
    t.boolean "exclude_from_onix"
    t.string "language", limit: 255
    t.string "spelling", limit: 255
    t.boolean "rights_edition"
    t.integer "foreignright_id"
    t.string "keywords", limit: 255
    t.text "keyword_list"
    t.string "internal_reference", limit: 255
    t.integer "item_code_id"
    t.string "edition_type_code", limit: 255
    t.text "bic_excellence"
    t.text "bic_basic"
    t.string "trade_category", limit: 255
    t.boolean "non_book"
    t.integer "imprint_id"
    t.integer "publishername_id"
    t.boolean "no_validation"
    t.string "pages_roman", limit: 255
    t.integer "pages_arabic"
    t.string "copyright_year", limit: 255
    t.datetime "child_updated_at"
    t.boolean "do_not_include_in_onix"
    t.integer "status_sign_off_user_id"
    t.date "status_sign_off_date"
    t.boolean "force_reapproval", default: true
    t.datetime "last_onix_data_change", default: "2013-06-25 14:57:52"
    t.datetime "royalty_specifier_changed_at"
    t.date "pdf_ready_date"
    t.date "last_updated_for_sign_off"
    t.text "contributor_strapline"
    t.string "title_upcase_override", limit: 255
    t.boolean "omit_praise_from_ai"
    t.string "praise_for_on_ai", limit: 255
    t.text "ai_contributor_override_big"
    t.text "ai_contributor_override_small"
    t.integer "proprietary_edition_description_id"
    t.integer "proprietary_format_description_id"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.date "planned_pub_date"
    t.string "set_type", limit: 255
    t.integer "rightslist_bundle_id"
    t.text "genesis"
    t.datetime "last_validated_at"
    t.datetime "print_spec_updated_at"
    t.datetime "estimates_updated_at"
    t.string "distribution_configuration", limit: 255
    t.integer "force_ai_title_split_after_words"
    t.string "product_availability", limit: 255
    t.date "expected_availability_date"
    t.date "on_sale_date"
    t.string "epub_type_code", limit: 255
    t.string "epub_type_version", limit: 255
    t.string "epub_type_description", limit: 255
    t.string "epub_format_code", limit: 255
    t.string "epub_format_version", limit: 255
    t.string "epub_format_description", limit: 255
    t.string "epub_source_code", limit: 255
    t.string "epub_source_version", limit: 255
    t.string "epub_source_description", limit: 255
    t.string "epub_type_note", limit: 255
    t.boolean "no_contributor"
    t.string "unpriced_item_type_code", limit: 255
    t.integer "prices_count", default: 0
    t.integer "supplydetails_count", default: 0
    t.integer "book_briefs_count", default: 0
    t.integer "bookprints_count", default: 0
    t.integer "book_schedules_count", default: 0
    t.integer "royalty_batch_books_count", default: 0
    t.boolean "omit_ai_contributor_small"
    t.string "product_form", limit: 255
    t.text "product_form_detail", array: true
    t.string "feature_colour_of_cover", limit: 255
    t.string "feature_colour_of_page_edge", limit: 255
    t.string "feature_text_font", limit: 255
    t.string "feature_special_cover_material", limit: 255
    t.string "feature_dvd_region", limit: 255
    t.string "feature_epub_accessibility", limit: 255
    t.string "feature_cpsia_choking_hazard_warning", limit: 255
    t.string "feature_eu_toy_safety_hazard_warning", limit: 255
    t.text "feature_paper_environmental_statement"
    t.string "product_packaging", limit: 255
    t.text "product_form_description"
    t.integer "number_of_pieces"
    t.text "product_content_type", array: true
    t.boolean "use_edition_suppliers"
    t.string "availability_code", limit: 255
    t.boolean "force_availability_code", default: false
    t.boolean "force_product_availability", default: false
    t.integer "default_price_id"
    t.text "countries", array: true
    t.integer "ai_template_id"
    t.text "edition_type_codes", array: true
    t.string "edition_version_number", limit: 255
    t.boolean "use_work_ancillary_content_spec", default: true
    t.text "full_title"
    t.string "ai_override_format"
    t.date "out_of_print_date"
    t.date "public_announcement_date"
    t.date "trade_announcement_date"
    t.integer "map_scales", array: true
    t.text "reprint_notes"
    t.string "online_authorship_description"
    t.boolean "copublishers_share_isbns"
    t.integer "special_edition_of_id"
    t.integer "new_edition_type_expiry_months"
    t.integer "suggested_alternative_id"
    t.integer "edition_number_id"
    t.text "cip_record"
    t.string "legacy_identifier"
    t.string "rights_type"
    t.text "copyright_notice"
    t.string "rights_language_override"
    t.string "publishers_reference"
    t.decimal "page_trim_height_mm"
    t.decimal "page_trim_height_in"
    t.decimal "page_trim_width_mm"
    t.decimal "page_trim_width_in"
    t.decimal "product_height_mm"
    t.decimal "product_height_in"
    t.decimal "product_width_mm"
    t.decimal "product_width_in"
    t.decimal "product_thickness_mm"
    t.decimal "product_thickness_in"
    t.decimal "unit_weight_gr"
    t.decimal "unit_weight_oz"
    t.decimal "spherical_diameter_mm"
    t.decimal "spherical_diameter_in"
    t.decimal "cylindrical_diameter_mm"
    t.decimal "cylindrical_diameter_in"
    t.decimal "sheet_height_mm"
    t.decimal "sheet_height_in"
    t.decimal "sheet_width_mm"
    t.decimal "sheet_width_in"
    t.decimal "rolled_sheet_package_side_mm"
    t.decimal "rolled_sheet_package_side_in"
    t.integer "main_content_page_count"
    t.integer "number_of_words"
    t.integer "front_matter_page_count"
    t.integer "back_matter_page_count"
    t.integer "total_numbered_pages"
    t.integer "production_page_count"
    t.integer "absolute_page_count"
    t.integer "number_of_pages_in_print_counterpart"
    t.integer "notional_number_of_pages_in_print_counterpart"
    t.integer "content_page_count"
    t.integer "total_unnumbered_insert_page_count"
    t.interval "duration"
    t.interval "duration_of_introductory_matter"
    t.interval "duration_of_main_content"
    t.integer "filesize_bytes"
    t.text "ai_headline"
    t.boolean "allow_onix_exports", default: true, null: false
    t.string "default_price_status", limit: 2, default: "00", null: false
    t.integer "task_id"
    t.integer "replaced_book_id"
    t.string "identifying_doi"
    t.string "stock_location"
    t.string "stock_item_number"
    t.index ["altcontact_id"], name: "index_books_on_altcontact_id"
    t.index ["client_id", "legacy_identifier"], name: "index_books_on_client_id_and_legacy_identifier"
    t.index ["client_id", "replaced_book_id"], name: "index_books_on_client_id_and_replaced_book_id", where: "(replaced_book_id IS NOT NULL)"
    t.index ["client_id", "updated_at"], name: "index_books_on_client_id_and_updated_at"
    t.index ["client_id"], name: "index_books_on_client_id"
    t.index ["default_price_id"], name: "index_books_on_default_price_id"
    t.index ["edition_number_id"], name: "index_books_on_edition_number_id"
    t.index ["format_detail_id"], name: "index_books_on_format_detail_id"
    t.index ["format_id"], name: "index_books_on_format_id"
    t.index ["isbn", "full_title"], name: "index_books_on_isbn_and_full_title"
    t.index ["isbn"], name: "index_books_on_isbn"
    t.index ["monthly_sale_profile_id"], name: "index_books_on_monthly_sale_profile_id"
    t.index ["replaced_book_id"], name: "index_books_on_replaced_book_id"
    t.index ["returns_monthly_profile_id"], name: "index_books_on_returns_monthly_profile_id"
    t.index ["series_id"], name: "index_books_on_series_id"
    t.index ["special_edition_of_id"], name: "index_books_on_special_edition_of_id"
    t.index ["suggested_alternative_id"], name: "index_books_on_suggested_alternative_id"
    t.index ["task_id"], name: "index_books_on_task_id"
    t.index ["title"], name: "index_books_on_title"
    t.index ["user_id"], name: "index_books_on_user_id"
    t.index ["work_id", "pub_date"], name: "index_books_on_work_id_and_pub_date"
  end

  create_table "booksubjects", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["book_id"], name: "index_booksubjects_on_book_id"
    t.index ["client_id"], name: "index_booksubjects_on_client_id"
    t.index ["subject_id"], name: "index_booksubjects_on_subject_id"
    t.index ["user_id"], name: "index_booksubjects_on_user_id"
  end

  create_table "booksupportingresources", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.integer "supportingresources_id"
    t.integer "supportingresource_id"
    t.index ["book_id"], name: "index_booksupportingresources_on_book_id"
    t.index ["supportingresource_id"], name: "index_booksupportingresources_on_supportingresource_id"
    t.index ["supportingresources_id"], name: "index_booksupportingresources_on_supportingresources_id"
  end

  create_table "brief_setups", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "briefing_attachments", id: :serial, force: :cascade do |t|
    t.string "file_content_type", limit: 255
    t.string "file_file_name", limit: 255
    t.string "file_file_size", limit: 255
    t.integer "brief_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "briefing_text_setups", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "briefing_text_type", limit: 255
    t.text "briefing_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brief_setup_id"
    t.boolean "include_on_all_briefs_for_this_work"
  end

  create_table "briefing_texts", id: :serial, force: :cascade do |t|
    t.string "briefing_text_type", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.text "briefing_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brief_id"
    t.boolean "include_on_all_briefs_for_this_work"
  end

  create_table "briefs", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "briefable_type", limit: 255
    t.integer "briefable_id"
    t.string "title", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bulk_uploaders", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "attachment_content_type", limit: 255
    t.string "attachment_file_name", limit: 255
    t.integer "attachment_file_size"
    t.date "attachment_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendars", id: :serial, force: :cascade do |t|
    t.integer "calendarable_id"
    t.string "calendarable_type", limit: 255
    t.integer "client_id"
    t.string "name", limit: 255
    t.integer "history_qty"
    t.string "history_unit", limit: 255
    t.integer "future_qty"
    t.string "future_unit", limit: 255
    t.string "uuid", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["calendarable_id", "calendarable_type"], name: "index_calendars_on_calendarable_id_and_calendarable_type"
    t.index ["uuid"], name: "index_calendars_on_uuid"
  end

  create_table "catalogue_archives", id: :serial, force: :cascade do |t|
    t.string "pdf_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_catalogue_archives_on_client_id"
    t.index ["user_id"], name: "index_catalogue_archives_on_user_id"
  end

  create_table "catalogue_pages", id: :serial, force: :cascade do |t|
    t.integer "catalogue_template_id"
    t.string "title", limit: 255
    t.text "body"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalogue_template_id"], name: "index_catalogue_pages_on_catalogue_template_id"
  end

  create_table "catalogue_template_contacts", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "catalogue_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalogue_template_id"], name: "index_catalogue_template_contacts_on_catalogue_template_id"
    t.index ["contact_id"], name: "index_catalogue_template_contacts_on_contact_id"
  end

  create_table "catalogue_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_for_cover"
    t.string "title", limit: 255
    t.string "dateline", limit: 255
    t.string "strapline", limit: 255
    t.string "running_header", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_catalogue_templates_on_client_id"
    t.index ["user_id"], name: "index_catalogue_templates_on_user_id"
  end

  create_table "channel_product_forms", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "masterchannel_id", null: false
    t.integer "channel_id", null: false
    t.string "product_form", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id", "product_form"], name: "index_channel_product_forms_on_channel_id_and_product_form"
    t.index ["product_form", "channel_id"], name: "index_channel_product_forms_on_product_form_and_channel_id", unique: true
  end

  create_table "channel_sale_cashflows", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "channel_id", null: false
    t.string "base_date", limit: 255, null: false
    t.integer "month_no", null: false
    t.decimal "cashflow_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id", "month_no"], name: "index_channel_sale_cashflows_on_channel_id_and_month_no"
  end

  create_table "channels", id: :serial, force: :cascade do |t|
    t.string "channel_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.decimal "ave_distribution_rate"
    t.decimal "ave_sales_rep_rate"
    t.integer "rightlist_id"
    t.decimal "average_royalty_rate"
    t.integer "default_royalty_basis"
    t.datetime "royalty_specifier_changed_at"
    t.decimal "default_discount"
    t.integer "currency_id"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.integer "sale_cashflow_monthly_profile_id"
    t.decimal "pristine_returns_rate", default: "30.0", null: false
    t.decimal "returns_restock_charge_per_unit", default: "0.0", null: false
    t.decimal "returns_pulp_charge_per_unit", default: "0.0", null: false
    t.decimal "returns_credit_rate", default: "6.0", null: false
    t.decimal "commissionable_sales_rate", default: "100.0", null: false
    t.integer "distributor_name_contact_id"
    t.text "sale_allocation_eval"
    t.integer "masterchannel_id"
    t.text "inc_product_forms", default: [], null: false, array: true
    t.text "exc_product_forms", default: [], null: false, array: true
    t.string "code"
    t.index ["client_id", "code"], name: "index_channels_on_client_id_and_code", unique: true
    t.index ["client_id"], name: "index_channels_on_client_id"
    t.index ["masterchannel_id"], name: "index_channels_on_masterchannel_id"
    t.index ["monthly_sale_profile_id"], name: "index_channels_on_monthly_sale_profile_id"
    t.index ["returns_monthly_profile_id"], name: "index_channels_on_returns_monthly_profile_id"
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "channeltypes", id: :serial, force: :cascade do |t|
    t.integer "channel_id"
    t.integer "client_id"
    t.integer "masterchannel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id"], name: "index_channeltypes_on_channel_id"
    t.index ["client_id"], name: "index_channeltypes_on_client_id"
    t.index ["masterchannel_id"], name: "index_channeltypes_on_masterchannel_id"
  end

  create_table "charge_finance_codes", id: :serial, force: :cascade do |t|
    t.integer "finance_code_id"
    t.string "chargeable_type", limit: 255
    t.integer "chargeable_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "percentage"
    t.index ["chargeable_id", "chargeable_type"], name: "index_charge_finance_codes_chargeable"
    t.index ["finance_code_id", "chargeable_id", "chargeable_type"], name: "index_charge_finance_codes_finance_chargeable"
  end

  create_table "charge_finance_codes_nonuniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "finance_code_id"
    t.string "chargeable_type", limit: 255
    t.integer "chargeable_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "percentage"
  end

  create_table "charge_finance_codes_uniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "finance_code_id"
    t.string "chargeable_type", limit: 255
    t.integer "chargeable_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "percentage"
  end

  create_table "chargeables", id: :serial, force: :cascade do |t|
    t.integer "print_item_cost_centre_id"
    t.string "chargeable_type", limit: 255
    t.integer "chargeable_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "client_id"
    t.index ["user_id"], name: "index_cities_on_user_id"
  end

  create_table "clauses", id: :serial, force: :cascade do |t|
    t.string "clause_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "clause_heading", limit: 255
    t.text "clause_text"
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "erratum"
    t.index ["client_id", "clause_number"], name: "index_clauses_on_client_id_and_clause_number"
    t.index ["client_id"], name: "index_clauses_on_client_id"
    t.index ["user_id"], name: "index_clauses_on_user_id"
  end

  create_table "clausetypes", id: :serial, force: :cascade do |t|
    t.integer "clause_id"
    t.integer "contracttemplate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "seq"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["clause_id"], name: "index_clausetypes_on_clause_id"
    t.index ["client_id"], name: "index_clausetypes_on_client_id"
    t.index ["contracttemplate_id"], name: "index_clausetypes_on_contracttemplate_id"
    t.index ["user_id"], name: "index_clausetypes_on_user_id"
  end

  create_table "client_applications", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "url", limit: 255
    t.string "support_url", limit: 255
    t.string "callback_url", limit: 255
    t.string "key", limit: 40
    t.string "secret", limit: 40
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_client_applications_on_key", unique: true
  end

  create_table "client_currencies", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.string "currency_code", limit: 3, null: false
    t.text "country_codes", default: [], null: false, array: true
    t.text "excluded_country_codes", default: [], null: false, array: true
    t.text "territory_codes", default: [], null: false, array: true
    t.boolean "active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_groups", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "group_id"
    t.integer "user_id"
    t.date "valid_from"
    t.date "valid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_import_export_file_actions", id: :serial, force: :cascade do |t|
    t.integer "client_import_export_file_id"
    t.string "action_type", limit: 255
    t.text "notes"
    t.integer "message_type"
    t.integer "user_id"
    t.datetime "created_at"
    t.index ["client_import_export_file_id", "created_at"], name: "client_import_export_file_actions_id_created"
  end

  create_table "client_import_export_file_errors", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_import_export_file_id"
    t.integer "client_import_export_file_errorable_id"
    t.string "client_import_export_file_errorable_type", limit: 255
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_import_export_file_errorable_id", "client_import_export_file_errorable_type"], name: "client_import_export_file_errors_errorable"
    t.index ["client_import_export_file_id"], name: "client_import_export_file_errors_file_id"
  end

  create_table "client_import_export_file_objects", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_import_export_file_id"
    t.integer "client_import_export_file_loggable_id"
    t.string "client_import_export_file_loggable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "object_data"
    t.string "object_data_signature", limit: 255
    t.index ["client_import_export_file_id"], name: "client_import_export_file_objects_file_id"
    t.index ["client_import_export_file_loggable_id", "client_import_export_file_loggable_type"], name: "client_import_export_file_objects_loggable"
  end

  create_table "client_import_export_file_types", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.string "direction", limit: 255
    t.text "description"
    t.string "processing_class", limit: 255
    t.string "processing_method", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_import_export_file_types_on_client_id"
  end

  create_table "client_import_export_files", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "client_import_export_file_type_id"
    t.string "data_file_name", limit: 255
    t.integer "data_file_size"
    t.integer "data_file_row_count"
    t.string "data_file_content_type", limit: 255
    t.datetime "data_file_updated_at"
    t.text "notes"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data_file_signature", limit: 255
    t.index ["client_id"], name: "index_client_import_export_files_on_client_id"
  end

  create_table "client_marketing_setups", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "text_type", limit: 255
    t.string "legacy_code", limit: 255
    t.text "pull_quote"
    t.text "marketing_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_product_form", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "product_form", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id", "product_form"], name: "index_client_product_form_on_client_id_and_product_form", unique: true
  end

  create_table "clients", id: :serial, force: :cascade do |t|
    t.string "client_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "identifier", limit: 255
    t.boolean "use_default_css"
    t.boolean "acts_as_group"
    t.text "oauth_token_twitter"
    t.text "oauth_token_secret_twitter"
    t.text "consumer_key_twitter"
    t.text "consumer_secret_twitter"
    t.integer "threshold_for_sign_off"
    t.boolean "set_up_blank_marketing_texts"
    t.integer "books_count", default: 0
    t.integer "works_count", default: 0
    t.integer "default_role_set_id"
    t.text "shopify_api_key"
    t.text "shopify_api_password"
    t.string "shopify_shopname", limit: 255
    t.text "sendowl_api_key"
    t.text "sendowl_api_secret"
    t.text "aws_access_key_id"
    t.text "aws_secret_key"
    t.text "associate_tag"
    t.string "default_currency_code", limit: 3
    t.text "staging_shopify_api_key"
    t.text "staging_shopify_api_password"
    t.text "staging_shopify_shopname"
    t.boolean "allow_alterative_marketing_texts"
    t.uuid "system_key", default: -> { "uuid_generate_v4()" }
    t.text "mailchimp_api_key"
    t.text "slack_api_key"
    t.boolean "enable_slack_notifications"
    t.boolean "enable_email_notifications"
    t.string "shopify_webhook_signature"
    t.text "smartystreets_serverside_auth_id"
    t.text "smartystreets_serverside_auth_token"
    t.text "standard_price_types", default: ["gbp_inctax", "usd_exctax"], null: false, array: true
    t.text "standard_price_qualifiers", default: ["consumer"], null: false, array: true
    t.string "default_language_code", limit: 3, default: "eng", null: false
    t.text "rights_types", default: [], null: false, array: true
    t.boolean "use_head_rights_logic", default: false, null: false
    t.decimal "royalty_statement_deminimus_amount", default: "0.0", null: false
    t.boolean "allow_onix_exports_default", default: true, null: false
    t.boolean "apply_digital_original_automatically", default: true, null: false
    t.string "default_price_status", limit: 2, default: "00", null: false
    t.boolean "use_contract_opening_balances", default: false, null: false
    t.boolean "allow_ebooks_to_share_isbns", default: false, null: false
    t.string "salesforce_url"
    t.boolean "nur_subject_scheme", default: false
    t.boolean "uses_gprc", default: false, null: false
    t.boolean "stock_management", default: false, null: false
    t.string "country_code", limit: 6
    t.index ["system_key"], name: "index_clients_on_system_key"
  end

  create_table "collection_items", id: :serial, force: :cascade do |t|
    t.integer "collectable_id"
    t.integer "collection_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "page_type", limit: 255
    t.string "collectable_type", limit: 255
    t.index ["collectable_id", "collectable_type"], name: "index_collection_items_collectable"
    t.index ["collectable_id", "collectable_type"], name: "index_collection_items_on_collectable_id_and_collectable_type"
    t.index ["collection_id", "collectable_type"], name: "index_collection_items_collection_collectable"
    t.index ["collection_id"], name: "index_collection_items_on_collection_id"
  end

  create_table "collection_proprietary_edition_descriptions", id: :serial, force: :cascade do |t|
    t.integer "collection_id"
    t.integer "proprietary_edition_description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_task_items", id: :serial, force: :cascade do |t|
    t.integer "collection_task_id"
    t.integer "collection_item_id"
    t.text "notes"
    t.datetime "started_at"
    t.datetime "on_hold_at"
    t.datetime "completed_at"
    t.integer "position"
    t.index ["collection_item_id", "collection_task_id"], name: "index_collection_task_items_item_task"
    t.index ["collection_task_id", "collection_item_id"], name: "index_collection_task_items_task_item"
  end

  create_table "collection_tasks", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "collection_id"
    t.string "name", limit: 12
    t.text "description"
    t.integer "owning_user_id"
    t.integer "assigned_user_id"
    t.date "target_completion_date"
    t.date "actual_completion_date"
    t.boolean "archive", default: false
    t.boolean "private", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "default_landing_page"
    t.index ["assigned_user_id"], name: "index_collection_tasks_on_assigned_user_id"
    t.index ["collection_id"], name: "index_collection_tasks_on_collection_id"
    t.index ["owning_user_id"], name: "index_collection_tasks_on_owning_user_id"
  end

  create_table "collections", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "collection_type", limit: 255
    t.boolean "private"
    t.string "ancestry", limit: 255
    t.integer "position"
    t.text "catalogue_layout"
    t.index ["ancestry"], name: "index_collections_on_ancestry"
    t.index ["client_id"], name: "index_collections_on_client_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.integer "contact_id"
    t.string "author", limit: 255
    t.string "email", limit: 255
    t.string "ip", limit: 255
    t.string "url", limit: 255
    t.text "body"
    t.boolean "published"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["contact_id"], name: "index_comments_on_contact_id"
    t.index ["original_id"], name: "index_comments_on_original_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "sender_name", limit: 255
    t.string "contact_name", limit: 255
    t.string "email_address", limit: 255
    t.string "addressee_name", limit: 255
    t.string "message_note", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "text1"
    t.text "text2"
    t.text "text3"
    t.text "text4"
    t.text "text5"
    t.text "text6"
    t.text "text7"
    t.text "text8"
    t.text "text9"
    t.text "text10"
    t.integer "client_id"
    t.text "text11"
    t.text "text12"
    t.text "text13"
    t.text "text14"
    t.text "text15"
    t.text "text16"
    t.text "text17"
    t.text "text18"
    t.text "text19"
    t.text "text20"
    t.text "text21"
    t.text "text22"
    t.text "text23"
    t.text "text24"
    t.text "text25"
    t.text "text26"
    t.text "text27"
    t.text "text28"
    t.text "text29"
    t.text "text30"
    t.string "default_currency", limit: 255
    t.string "default_language", limit: 255
    t.string "category_scheme_preference", limit: 255
    t.text "royalty_statement_copy_one"
    t.text "royalty_statement_copy_two"
    t.text "royalty_statement_copy_three"
    t.text "royalty_statement_copy_four"
    t.text "royalty_statement_copy_five"
    t.text "royalty_statement_copy_six"
    t.text "royalty_statement_copy_seven"
    t.text "royalty_statement_copy_eight"
    t.text "royalty_statement_copy_nine"
    t.text "royalty_statement_copy_ten"
    t.text "royalty_statement_copy_eleven"
    t.string "nielsen_login", limit: 255
    t.string "nielsen_password", limit: 255
    t.date "nielsen_data_last_sent"
    t.date "nielsen_images_last_sent"
    t.string "bowker_login", limit: 255
    t.string "bowker_password", limit: 255
    t.date "bowker_data_last_sent"
    t.date "bowker_images_last_sent"
    t.string "amazoncouk_login", limit: 255
    t.string "amazoncouk_password", limit: 255
    t.date "amazoncouk_data_last_sent"
    t.date "amazoncouk_images_last_sent"
    t.string "bds_login", limit: 255
    t.string "bds_password", limit: 255
    t.date "bds_data_last_sent"
    t.date "bds_images_last_sent"
    t.string "gardners_login", limit: 255
    t.string "gardners_password", limit: 255
    t.date "gardners_data_last_sent"
    t.date "gardners_images_last_sent"
    t.integer "sales_person_id"
    t.integer "distributor_id"
    t.text "address"
    t.string "phone", limit: 255
    t.date "first_statement_date"
    t.integer "statement_sales_lag_months"
    t.integer "statement_min_book_sale_months"
    t.integer "origination_amortisation_months"
    t.decimal "default_printer_invoice_terms"
    t.decimal "default_shipment_lead_time"
    t.integer "default_printer_contact_id"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.integer "sale_cashflow_monthly_profile_id"
    t.string "bic_discount_code", limit: 255
    t.string "onix_sender_company_name", limit: 255
    t.string "onix_sender_contact", limit: 255
    t.string "onix_sender_contact_email", limit: 255
    t.string "onix_sender_ean_number", limit: 255
    t.string "onix_sender_san", limit: 255
    t.string "isni", limit: 19
    t.text "extra_advance_triggers", default: [], null: false, array: true
    t.text "legacy_codes"
    t.text "logo_url"
    t.index ["client_id"], name: "index_companies_on_client_id"
    t.index ["distributor_id"], name: "index_companies_on_distributor_id"
    t.index ["sales_person_id"], name: "index_companies_on_sales_person_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_statement_months", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "company_id", null: false
    t.integer "month_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_contact_types", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "contact_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["contact_id"], name: "index_contact_contact_types_on_contact_id"
    t.index ["contact_type_id"], name: "index_contact_contact_types_on_contact_type_id"
  end

  create_table "contact_digital_asset_transfer_includes", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "contact_digital_asset_transfer_id", null: false
    t.integer "transfer_includeable_id", null: false
    t.string "transfer_includeable_type", null: false
    t.datetime "created_at"
    t.integer "book_id"
    t.string "fingerprint"
    t.index ["book_id", "transfer_includeable_type", "contact_digital_asset_transfer_id"], name: "index_contact_digital_asset_transfer_includes_bk_typ_trnsfr"
    t.index ["contact_digital_asset_transfer_id", "transfer_includeable_id", "transfer_includeable_type"], name: "index_contact_digital_asset_transfer_includes_1"
    t.index ["transfer_includeable_id", "transfer_includeable_type", "contact_digital_asset_transfer_id"], name: "index_contact_digital_asset_transfer_includes_2"
  end

  create_table "contact_digital_asset_transfer_templates", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "digital_asset_subtype"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "digital_asset_subtype_id"
    t.integer "transferable_id"
    t.string "transferable_type", limit: 255
    t.integer "supplier_ids", default: [], null: false, array: true
    t.text "product_forms", default: [], null: false, array: true
    t.date "pub_dates_from"
    t.boolean "compress", default: false
    t.text "epub_type_codes", default: [], null: false, array: true
    t.text "price_currency_codes", default: [], null: false, array: true
    t.text "price_type_codes", default: [], null: false, array: true
    t.text "price_type_qualifier_codes", default: [], null: false, array: true
    t.integer "publishername_ids", default: [], array: true
    t.string "covers_directory"
    t.string "ebook_files_directory"
    t.boolean "send_ebook_files", default: false, null: false
    t.boolean "send_cover_files", default: false, null: false
    t.string "cover_style"
    t.boolean "include_media_file_link", default: true
    t.boolean "use_isbn_as_reference", default: false, null: false
    t.boolean "suppress_market_representations", default: false, null: false
    t.boolean "require_isbn", default: true
    t.integer "exclude_seriesname_ids", default: [], null: false, array: true
    t.boolean "send_eur_prices_excvat", default: false, null: false
    t.text "exctax_currency_codes", default: [], array: true
    t.boolean "append_number_to_series", default: false, null: false
    t.boolean "suppress_price_countries", default: false, null: false
    t.boolean "create_sets_for_work_derivations", default: false, null: false
    t.boolean "send_internal_work_identifier_only", default: false, null: false
    t.boolean "apply_coresource_product_form_description", default: false, null: false
    t.integer "group_id"
    t.boolean "prioritise_related_products_for_format", default: false, null: false
    t.boolean "use_print_isbn_as_reference", default: false, null: false
    t.boolean "add_person_name", default: false, null: false
    t.boolean "send_publishers_subject_categories", default: false, null: false
    t.integer "cover_file_name_format", default: 0, null: false
    t.boolean "send_publisher_category_as_hierarchy", default: false, null: false
    t.text "product_relation_codes", default: [], null: false, array: true
    t.string "onix_file_name_pattern"
    t.string "directory"
    t.boolean "send_publishers_work_url", default: false, null: false
    t.boolean "use_alternative_marketing_text", default: false, null: false
    t.boolean "add_barcode_indicator", default: false, null: false
    t.boolean "allow_pub_date_on_any_status", default: false, null: false
    t.boolean "suppress_auto_supplier_expected_ship_date", default: false, null: false
    t.index ["contact_id"], name: "index_contact_digital_asset_transfer_templates_on_contact_id"
    t.index ["digital_asset_subtype_id"], name: "index_contact_digital_asset_transfer_templates_da"
    t.index ["transferable_id", "transferable_type"], name: "index_contact_digital_asset_transfer_templates_txfr"
  end

  create_table "contact_digital_asset_transfers", id: :serial, force: :cascade do |t|
    t.integer "digital_asset_id"
    t.integer "contact_digital_asset_transfer_template_id"
    t.datetime "started_at"
    t.string "direction", limit: 255
    t.string "push_or_pull", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mode", limit: 255
    t.integer "transfer_loggable_id"
    t.string "transfer_loggable_type"
    t.index ["contact_digital_asset_transfer_template_id"], name: "index_contact_digital_asset_transfers_template"
    t.index ["transfer_loggable_id", "transfer_loggable_type"], name: "index_contact_digital_asset_transfers_loggable"
  end

  create_table "contact_distribution_supply_lists", id: :serial, force: :cascade do |t|
    t.integer "contact_distribution_id"
    t.integer "supply_list_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["contact_distribution_id", "supply_list_id"], name: "index_contact_distribution_supply_lists_contact_supply"
    t.index ["supply_list_id", "contact_distribution_id"], name: "index_contact_distribution_supply_lists_supply_contact"
  end

  create_table "contact_distributions", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "distributable_id"
    t.string "distributable_type", limit: 255
    t.boolean "distributor_for_all_supply_lists"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["contact_id"], name: "index_contact_distributions_on_contact_id"
    t.index ["distributable_id", "distributable_type"], name: "index_contact_distributions_distributable"
  end

  create_table "contact_mailing_lists", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "mailing_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_contact_mailing_lists_on_contact_id"
    t.index ["mailing_list_id"], name: "index_contact_mailing_lists_on_mailing_list_id"
  end

  create_table "contact_marketing_items", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "marketing_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["contact_id"], name: "index_contact_marketing_items_on_contact_id"
    t.index ["marketing_item_id"], name: "index_contact_marketing_items_on_marketing_item_id"
  end

  create_table "contact_prints", id: :serial, force: :cascade do |t|
    t.integer "print_id"
    t.integer "contact_id"
    t.string "contact_role", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.date "valid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_contact_prints_on_contact_id"
    t.index ["print_id"], name: "index_contact_prints_on_print_id"
  end

  create_table "contact_seriesnames", id: :serial, force: :cascade do |t|
    t.integer "seriesname_id"
    t.integer "contact_id"
    t.date "valid_from"
    t.date "valid_to"
    t.string "contact_role", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sequence_number"
    t.index ["contact_id"], name: "index_contact_seriesnames_on_contact_id"
    t.index ["seriesname_id"], name: "index_contact_seriesnames_on_seriesname_id"
  end

  create_table "contact_types", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 255
    t.boolean "include_on_statements"
    t.string "category", limit: 255
    t.index ["client_id"], name: "index_contact_types_on_client_id"
    t.index ["user_id"], name: "index_contact_types_on_user_id"
  end

  create_table "contactfeatures", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "feature_type", limit: 255
    t.string "feature_title", limit: 255
    t.string "feature_content", limit: 255
    t.string "feature_date", limit: 255
    t.string "feature_email", limit: 255
    t.string "feature_website", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.index ["client_id"], name: "index_contactfeatures_on_client_id"
    t.index ["contact_id"], name: "index_contactfeatures_on_contact_id"
    t.index ["user_id"], name: "index_contactfeatures_on_user_id"
  end

  create_table "contacts", id: :serial, force: :cascade do |t|
    t.string "person_name_inverted", limit: 255
    t.string "titles_before_names", limit: 255
    t.string "names_before_key", limit: 255
    t.string "keynames", limit: 255
    t.string "corporate_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cross_accounting", limit: 255
    t.integer "client_id"
    t.string "alternative_name_type", limit: 255
    t.string "alternative_names_before_key", limit: 255
    t.string "alternative_key_names", limit: 255
    t.string "contributor_type", limit: 255
    t.string "association_type", limit: 255
    t.integer "assoc_contributor_id"
    t.integer "user_id"
    t.text "biographical_note"
    t.date "last_statement_date"
    t.string "sort_code", limit: 255
    t.string "account_number", limit: 255
    t.string "account_name", limit: 255
    t.string "bank_name", limit: 255
    t.string "bank_address_one", limit: 255
    t.string "bank_address_two", limit: 255
    t.string "bank_address_three", limit: 255
    t.string "bank_address_four", limit: 255
    t.string "swift_code", limit: 255
    t.string "routing", limit: 255
    t.boolean "set_as_default_address"
    t.string "preferred_time_for_phone_interviews", limit: 255
    t.string "place_of_birth", limit: 255
    t.string "citizenship", limit: 255
    t.boolean "children"
    t.text "reader_questions"
    t.text "suggestions_for_back_matter"
    t.text "suggestions_for_cover"
    t.integer "owner"
    t.string "keyname_prefix", limit: 255
    t.string "name_after_keyname", limit: 255
    t.string "suffix_after_keyname", limit: 255
    t.string "qualification_after_keyname", limit: 255
    t.string "titles_after_names", limit: 255
    t.date "date_of_birth"
    t.string "person_name", limit: 255
    t.integer "currency_id"
    t.decimal "cost_per_kilo"
    t.decimal "cost_per_pallet"
    t.text "default_shipping_instructions"
    t.string "twitter_name_", limit: 255
    t.integer "creator_1_id"
    t.integer "creator_2_id"
    t.integer "creator_3_id"
    t.integer "contact_marketing_item_id"
    t.integer "marketing_item_id"
    t.string "default_report", limit: 255
    t.string "default_book_set", limit: 255
    t.integer "book_collection_id"
    t.string "default_report_delivery", limit: 255
    t.integer "digital_asset_subtype_id"
    t.string "location", limit: 255
    t.boolean "is_a_single_name_person"
    t.text "supplier_ref"
    t.text "customer_ref"
    t.integer "distributor_max_title_length"
    t.string "supplier_name", limit: 255
    t.string "supplier_telephone_number", limit: 255
    t.string "supplier_fax_number", limit: 255
    t.string "supplier_email_address", limit: 255
    t.string "default_supplier_role_code", limit: 255
    t.integer "rating"
    t.date "date_of_death"
    t.integer "year_of_birth"
    t.integer "year_of_death"
    t.string "isni", limit: 19
    t.string "onix_addressee_id_type"
    t.string "onix_addressee_id_type_name"
    t.string "onix_addressee_id_value"
    t.string "onix_to_company"
    t.string "onix_to_person"
    t.string "orcid_id"
    t.text "prominence_reason"
    t.uuid "system_key"
    t.string "address_as"
    t.string "pronunciation_guide"
    t.text "bio_for_press_release"
    t.text "selling_points_for_press_release"
    t.string "corporate_acronym"
    t.string "gender"
    t.boolean "deceased", default: false, null: false
    t.text "gender_clarification"
    t.integer "print_on_demand_order_days"
    t.string "legacy_identifier"
    t.boolean "reports_stock_levels", default: false, null: false
    t.string "born_in"
    t.string "died_in"
    t.string "formerly_resided_in"
    t.string "currently_resides_in"
    t.string "educated_in"
    t.string "worked_in"
    t.string "flourished_in"
    t.string "citizen_of"
    t.string "identifier"
    t.string "distributeurscode_boekenbank"
    t.string "fondscode_boekenbank"
    t.string "supplier_standard_address_number", limit: 7
    t.string "supplier_global_location_number", limit: 13
    t.index "upper(btrim((corporate_name)::text)), client_id", name: "index_contacts_corp_name_client"
    t.index ["assoc_contributor_id"], name: "index_contacts_on_assoc_contributor_id"
    t.index ["client_id", "identifier"], name: "index_contacts_on_client_id_and_identifier"
    t.index ["client_id", "isni"], name: "index_contacts_on_client_id_and_isni", unique: true
    t.index ["client_id", "keynames"], name: "index_contacts_on_client_id_and_keynames"
    t.index ["client_id", "legacy_identifier"], name: "index_contacts_on_client_id_and_legacy_identifier"
    t.index ["client_id", "reports_stock_levels"], name: "index_contacts_on_client_id_and_reports_stock_levels", where: "(reports_stock_levels = true)"
    t.index ["system_key"], name: "index_contacts_on_system_key"
  end

  create_table "contained_items", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "container_book_id"
    t.integer "contained_book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_quantity"
    t.index ["contained_book_id"], name: "index_contained_items_on_contained_book_id"
    t.index ["container_book_id"], name: "index_contained_items_on_container_book_id"
  end

  create_table "content_items", id: :serial, force: :cascade do |t|
    t.integer "content_itemisable_id"
    t.string "content_itemisable_type", limit: 255
    t.integer "client_id"
    t.integer "level_sequence_array", array: true
    t.string "text_item_type", limit: 255
    t.integer "first_page_number"
    t.integer "last_page_number"
    t.integer "number_of_pages"
    t.string "component_type_name", limit: 255
    t.string "component_number", limit: 255
    t.string "distinctive_title", limit: 255
    t.integer "work_id"
    t.integer "contributor_ids", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "workcontact_id"
    t.index ["content_itemisable_id", "content_itemisable_type"], name: "index_contents_items_id_type"
    t.index ["workcontact_id"], name: "index_content_items_on_workcontact_id"
  end

  create_table "contract_attachments", id: :serial, force: :cascade do |t|
    t.integer "contract_id"
    t.string "doc_file_name", limit: 255
    t.string "doc_content_type", limit: 255
    t.string "doc_file_size", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_type", limit: 255
    t.integer "foreignright_id"
    t.integer "work_id"
    t.index ["client_id"], name: "index_contract_attachments_on_client_id"
    t.index ["contract_id"], name: "index_contract_attachments_on_contract_id"
    t.index ["user_id"], name: "index_contract_attachments_on_user_id"
  end

  create_table "contract_channels", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "contract_id", null: false
    t.integer "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_contract_channels_on_channel_id"
    t.index ["contract_id"], name: "index_contract_channels_on_contract_id"
  end

  create_table "contract_texts", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "body"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "sequence_number"
    t.index ["client_id"], name: "index_contract_texts_on_client_id"
    t.index ["contract_id"], name: "index_contract_texts_on_contract_id"
  end

  create_table "contractcontributor_alternative_payees", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "contractcontributor_id", null: false
    t.integer "alternative_payee_id", null: false
    t.decimal "pay_percentage"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "after_deminimus", default: true, null: false
    t.index ["alternative_payee_id", "contractcontributor_id"], name: "index_contractcontributor_alternative_payees_alt_contcontrib", unique: true
    t.index ["contractcontributor_id", "alternative_payee_id"], name: "index_contractcontributor_alternative_payees_contcontrib_alt", unique: true
  end

  create_table "contractcontributor_sale_royalties", id: :serial, force: :cascade do |t|
    t.integer "sale_royalty_id", null: false
    t.integer "contractcontributor_id", null: false
    t.integer "client_id", null: false
    t.decimal "calculated_royalty_payment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.float "payment_split"
    t.decimal "change_in_payable_amount", null: false
    t.integer "book_id", null: false
    t.index ["contractcontributor_id"], name: "index_contractcontributor_sale_royalties_on_contractcontrib_id"
    t.index ["sale_royalty_id"], name: "index_contractcontributor_sale_royalties_on_sale_royalty_id"
  end

  create_table "contractcontributors", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "payment_split"
    t.integer "contracttemplate_id"
    t.integer "client_id"
    t.integer "user_id"
    t.date "contract_received_back"
    t.decimal "opening_balance_amt", default: "0.0", null: false
    t.index ["contact_id"], name: "index_contractcontributors_on_contributor_id"
    t.index ["contract_id"], name: "index_contractcontributors_on_contract_id"
  end

  create_table "contracts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "termination_reason", limit: 255
    t.string "contract_type", limit: 255
    t.string "signatory", limit: 255
    t.string "contract_name", limit: 255
    t.string "territory", limit: 255
    t.string "free_copies", limit: 255
    t.string "copyright_year", limit: 255
    t.string "type", limit: 255
    t.string "reserve", limit: 255
    t.string "author_discount", limit: 255
    t.string "remainder_rate", limit: 255
    t.string "cross_accounting", limit: 255
    t.string "free_copies_used", limit: 255
    t.string "statement_frequency", limit: 255
    t.string "term", limit: 255
    t.string "royalty_basis", limit: 255
    t.date "renewal_date"
    t.date "terminated_date"
    t.date "pub_before_date"
    t.date "signed_date"
    t.date "ms_delivery_date"
    t.date "ms_proofs_date"
    t.date "review_date"
    t.date "first_statement_date"
    t.integer "contracttemplate_id"
    t.integer "client_id"
    t.date "last_statement_date"
    t.decimal "guaranteed_royalty_value"
    t.float "flat_fee_value"
    t.integer "contractset_id"
    t.integer "owner"
    t.boolean "add_all_contributors_to_work_to_contract"
    t.date "next_statement"
    t.text "description"
    t.integer "statement_sales_lag_months"
    t.integer "statement_min_book_sale_months"
    t.integer "strategic_importance"
    t.decimal "remainder_rate_over_cost"
    t.boolean "omit_schedule_d"
    t.boolean "omit_schedule_a"
    t.boolean "omit_schedule_b"
    t.boolean "omit_schedule_c"
    t.integer "agent_id"
    t.integer "sales_rights_template_id"
    t.boolean "include_clause_numbers"
    t.boolean "has_all_head_rights", default: true, null: false
    t.boolean "omit_advances"
    t.boolean "omit_clause_heading"
    t.date "statement_start_date"
    t.date "revised_ms_delivery_date"
    t.index ["client_id", "updated_at"], name: "index_contracts_on_client_id_and_updated_at"
    t.index ["client_id"], name: "index_contracts_on_client_id"
    t.index ["contractset_id"], name: "index_contracts_on_contractset_id"
    t.index ["contracttemplate_id"], name: "index_contracts_on_contracttemplate_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "contractsets", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.string "contractset_name", limit: 255
    t.index ["client_id"], name: "index_contractsets_on_client_id"
    t.index ["user_id"], name: "index_contractsets_on_user_id"
  end

  create_table "contracttemplates", id: :serial, force: :cascade do |t|
    t.string "template_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "contains_errata"
    t.index ["client_id"], name: "index_contracttemplates_on_client_id"
    t.index ["user_id"], name: "index_contracttemplates_on_user_id"
  end

  create_table "copy_trackers", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.date "date_sent"
    t.integer "contact_id"
    t.string "reason", limit: 255
    t.text "result"
    t.integer "promotion_id"
    t.date "confirmed_received"
    t.string "format", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trackable_id"
    t.string "trackable_type", limit: 255
    t.string "image_file_name"
    t.integer "number_sent"
    t.index ["book_id"], name: "index_copy_trackers_on_book_id"
    t.index ["contact_id"], name: "index_copy_trackers_on_contact_id"
    t.index ["trackable_id", "trackable_type"], name: "index_copy_trackers_on_trackable_id_and_trackable_type"
  end

  create_table "cost_estimate_scale_elements", id: :serial, force: :cascade do |t|
    t.integer "cost_estimate_id"
    t.integer "user_id"
    t.integer "scale_element_id"
    t.text "component_prices", array: true
    t.string "currency_code", limit: 3
    t.decimal "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cost_estimate_id"], name: "index_cost_estimate_scale_elements_on_cost_estimate_id"
    t.index ["scale_element_id"], name: "index_cost_estimate_scale_elements_on_scale_element_id"
  end

  create_table "cost_estimates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "costable_id"
    t.string "costable_type", limit: 255
    t.integer "jobs"
    t.integer "products"
    t.integer "units"
    t.integer "pages"
    t.integer "words"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 255
    t.text "description"
    t.string "currency_code", limit: 3
    t.decimal "accepted_cost"
    t.integer "images"
    t.integer "links"
    t.index ["costable_id", "costable_type"], name: "index_cost_estimates_on_costable_id_and_costable_type"
  end

  create_table "cost_groups", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order"
  end

  create_table "country_codes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cover_transmissions", id: :serial, force: :cascade do |t|
    t.integer "supportingresource_id"
    t.date "date_sent"
    t.integer "contact_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.decimal "exchange_rate_to_base"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "currencycode", limit: 255
    t.boolean "base_currency"
    t.boolean "default_currency"
    t.string "currency_symbol", limit: 255
    t.index ["client_id"], name: "index_currencies_on_client_id"
    t.index ["user_id"], name: "index_currencies_on_user_id"
  end

  create_table "currency_exchange_rates", id: :serial, force: :cascade do |t|
    t.string "currency_code_from", limit: 3
    t.string "currency_code_to", limit: 3
    t.date "as_of_date"
    t.decimal "rate"
    t.index ["currency_code_from", "currency_code_to", "as_of_date"], name: "index_currency_exchange_rates_from_to", unique: true
    t.index ["currency_code_to", "currency_code_from", "as_of_date"], name: "index_currency_exchange_rates_to_from", unique: true
  end

  create_table "custom_reports", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.string "modelname", limit: 255
    t.text "selected_columns", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
    t.boolean "private_custom_report", default: false, null: false
    t.boolean "shared_across_clients"
    t.index ["client_id"], name: "index_custom_reports_on_client_id"
    t.index ["user_id"], name: "index_custom_reports_on_user_id"
  end

  create_table "deals", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.integer "contact_id"
    t.decimal "deal_value"
    t.integer "pipeline_id"
    t.integer "stage_id"
    t.date "expected_close_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "dealable_type"
    t.integer "dealable_id"
    t.text "note"
  end

  create_table "default_lexicons", id: :serial, force: :cascade do |t|
    t.string "inbox_type", limit: 255
    t.string "inbox_name", limit: 255
    t.string "submission_name", limit: 255
    t.string "work_name", limit: 255
    t.string "submitter_name", limit: 255
    t.integer "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "defaults", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "extent_type", limit: 255
    t.string "extent_value", limit: 255
    t.string "extent_unit", limit: 255
    t.string "main_bisac_code", limit: 255
    t.string "main_bic_code", limit: 255
    t.string "audience", limit: 255
    t.string "imprint", limit: 255
    t.string "publisher", limit: 255
    t.string "publication_city", limit: 255
    t.string "publication_country", limit: 255
    t.string "publishing_status", limit: 255
    t.string "pub_date", limit: 255
    t.string "sales_rights_type", limit: 255
    t.string "measurement_type", limit: 255
    t.string "measurement_unit", limit: 255
    t.string "supplier_name", limit: 255
    t.string "product_availability", limit: 255
    t.string "price_type", limit: 255
    t.string "discount_type", limit: 255
    t.string "price_amount", limit: 255
    t.string "currency_code", limit: 255
    t.string "tax_rate", limit: 255
    t.string "taxable_amount", limit: 255
    t.string "tax_amount", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "default_set_name", limit: 255
    t.integer "channel_id"
    t.integer "user_id"
    t.text "description"
    t.integer "proprietary_edition_description_id"
    t.string "profile_type", limit: 255
    t.integer "imprint_id"
    t.integer "publishername_id"
    t.integer "extent_type_id"
    t.integer "extent_unit_id"
    t.integer "contract_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "queue", limit: 255
    t.integer "job_object_id"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
    t.index ["queue"], name: "index_delayed_jobs_on_queue"
  end

  create_table "delete_me_contact_roles", id: :integer, default: -> { "nextval('contact_roles_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contact_id"
    t.integer "work_id"
    t.string "role", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "workcontact_id"
    t.index ["client_id"], name: "index_contact_roles_on_client_id"
    t.index ["contact_id"], name: "index_contact_roles_on_contact_id"
    t.index ["user_id"], name: "index_contact_roles_on_user_id"
    t.index ["work_id"], name: "index_contact_roles_on_work_id"
    t.index ["workcontact_id"], name: "index_contact_roles_on_workcontact_id"
  end

  create_table "deliveries", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "delivery_source", limit: 255
    t.string "delivery_style", limit: 255
    t.date "delivery_date"
    t.date "dispatch_date"
    t.string "delivery_reference", limit: 255
    t.decimal "delivery_quantity"
    t.string "edition_id", limit: 255
    t.string "manufactured_qty", limit: 255
    t.string "consignee_ref", limit: 255
    t.integer "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "print_id"
    t.integer "book_id"
    t.string "vessel_name", limit: 255
    t.string "delivery_status", limit: 255
    t.string "shipping_terms", limit: 255
    t.date "ready_at_printer"
    t.integer "shipment_id"
    t.integer "channel_id"
    t.integer "print_bundle_component_id"
    t.integer "port_id"
    t.boolean "delivery_completed", default: false, null: false
    t.index ["client_id"], name: "index_deliveries_on_client_id"
    t.index ["contact_id"], name: "index_deliveries_on_contact_id"
    t.index ["edition_id"], name: "index_deliveries_on_edition_id"
    t.index ["print_bundle_component_id"], name: "index_deliveries_on_print_bundle_component_id"
    t.index ["print_id"], name: "index_deliveries_on_print_id"
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "designs", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.text "brief"
    t.text "strapline"
    t.text "cover_quote"
    t.text "author_wording"
    t.text "spine_author"
    t.text "spine_title"
    t.text "title_wording"
    t.text "back_copy"
    t.text "back_reviews"
    t.integer "barcode_box_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_designs_on_book_id"
    t.index ["contact_id"], name: "index_designs_on_contact_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "philips_id"
  end

  create_table "digital_asset_content_items", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "asset_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "digital_asset_subtype_id", null: false
    t.string "asset_text_signature", limit: 255, null: false
    t.string "digital_asset_item_includable_type", limit: 255, null: false
    t.integer "digital_asset_item_includable_id", null: false
    t.text "asset_properties"
    t.index ["digital_asset_item_includable_id", "digital_asset_item_includable_type"], name: "index_digital_Asset_content_items_includable"
    t.index ["digital_asset_item_includable_id", "digital_asset_item_includable_type"], name: "index_digital_asset_content_items_includable"
    t.index ["digital_asset_subtype_id"], name: "index_digital_asset_content_items_on_digital_asset_subtype_id"
  end

  create_table "digital_asset_contents", id: :serial, force: :cascade do |t|
    t.integer "digital_asset_id"
    t.integer "digital_asset_includable_id"
    t.string "digital_asset_includable_type", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_asset_includable_id"], name: "index_digital_asset_contents_on_digital_asset_includable_id"
  end

  create_table "digital_asset_subtypes", id: :serial, force: :cascade do |t|
    t.integer "digital_asset_type_id"
    t.string "subtype_name", limit: 255
    t.string "type_name", limit: 255
    t.string "preprocessing_method", limit: 255
    t.string "postprocessing_method", limit: 255
    t.string "header_method", limit: 255
    t.string "content_method", limit: 255
    t.string "footer_method", limit: 255
    t.string "validation_method", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "base_model"
    t.text "options"
    t.text "eager_loading_method"
  end

  create_table "digital_asset_types", id: :serial, force: :cascade do |t|
    t.string "type_name", limit: 255
    t.string "version", limit: 255
    t.string "format_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "digital_assets", id: :serial, force: :cascade do |t|
    t.integer "digital_asset_subtype_id"
    t.integer "size_in_bytes"
    t.boolean "is_valid"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name", limit: 255
    t.string "file_content_type", limit: 255
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.string "file_fingerprint", limit: 255
    t.integer "recipient_id"
    t.integer "export_batch_id"
    t.index ["digital_asset_subtype_id"], name: "index_digital_assets_on_digital_asset_subtype_id"
    t.index ["export_batch_id"], name: "index_digital_assets_on_export_batch_id"
    t.index ["recipient_id"], name: "index_digital_assets_on_recipient_id"
  end

  create_table "discount_codes", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "supplier_ids", default: [], null: false, array: true
    t.integer "recipient_ids", default: [], null: false, array: true
    t.text "price_currency_codes", default: [], null: false, array: true
    t.text "price_qualifier_codes", default: [], null: false, array: true
    t.string "discount_code_type", null: false
    t.string "discount_code_type_name"
    t.string "discount_code", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "prices_gteq"
    t.decimal "prices_lt"
    t.text "onix_audience_codes", default: [], array: true
    t.index ["client_id"], name: "index_discount_codes_on_client_id"
  end

  create_table "edition_import_batches", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "last_work"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edition_numbers", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "work_id", null: false
    t.integer "number", null: false
    t.text "edition_type_codes", default: [], null: false, array: true
    t.index ["client_id"], name: "index_edition_numbers_on_client_id"
    t.index ["work_id", "number"], name: "index_edition_numbers_on_work_id_and_number", unique: true
  end

  create_table "editorial_originations", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "name"
    t.integer "print_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_bundle_component_id"
    t.text "description"
    t.index ["print_bundle_component_id"], name: "index_editorial_originations_on_print_bundle_component_id"
  end

  create_table "emails", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "email", limit: 255
    t.boolean "default"
    t.string "email_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.index ["client_id"], name: "index_emails_on_client_id"
    t.index ["contact_id"], name: "index_emails_on_contact_id"
    t.index ["user_id"], name: "index_emails_on_user_id"
  end

  create_table "estimate_periods", id: :serial, force: :cascade do |t|
    t.integer "estimate_template_id"
    t.integer "period_in_days"
    t.integer "sales_percent"
    t.integer "quantity_percent"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "estimate_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "month_number"
    t.integer "percent_qty"
    t.integer "percent_value"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimated_rights_deal_revenues", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "estimated_rights_deal_id"
    t.string "revenue_type", limit: 255
    t.integer "monthly_sale_profile_id"
    t.date "deal_start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
  end

  create_table "estimated_rights_deals", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contract_id"
    t.integer "work_id"
    t.string "language", limit: 255
    t.string "rightstype", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimates", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "sale_quantity"
    t.float "sale_value"
    t.string "currency", limit: 255
    t.string "customer", limit: 255
    t.integer "retail_price"
    t.decimal "discount"
    t.integer "channel_id"
    t.date "invoice_date"
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "exclude"
    t.string "masterchannel_id", limit: 255
    t.string "invoice_number", limit: 255
    t.string "sales_type", limit: 255
    t.string "wrong_channel_alert", limit: 255
    t.integer "expectedsale_id"
    t.integer "currency_id"
    t.float "original_value"
    t.integer "original_currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estimate_type", limit: 255
    t.integer "licensed_right_id"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.integer "contact_id"
    t.index ["book_id"], name: "index_estimates_on_book_id"
    t.index ["monthly_sale_profile_id"], name: "index_estimates_on_monthly_sale_profile_id"
    t.index ["returns_monthly_profile_id"], name: "index_estimates_on_returns_monthly_profile_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.datetime "start_time"
    t.integer "user_id"
    t.string "title", limit: 255
    t.text "details"
    t.integer "contact_id"
    t.boolean "system_event"
    t.boolean "user_event"
    t.boolean "client_event"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "excels", id: :serial, force: :cascade do |t|
    t.string "xlsx_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_excels_on_client_id"
    t.index ["user_id"], name: "index_excels_on_user_id"
  end

  create_table "expectedsales", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.string "frequency", limit: 255
    t.string "url", limit: 255
    t.string "retailer", limit: 255
    t.integer "contact_id"
    t.integer "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["client_id"], name: "index_expectedsales_on_client_id"
    t.index ["contact_id"], name: "index_expectedsales_on_contact_id"
    t.index ["period_id"], name: "index_expectedsales_on_period_id"
    t.index ["user_id"], name: "index_expectedsales_on_user_id"
  end

  create_table "export_batch_items", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "export_batch_id", null: false
    t.integer "export_batchable_id", null: false
    t.string "export_batchable_type", null: false
    t.string "to_s", null: false
    t.string "status", null: false
    t.string "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "digital_asset_content_item_id"
    t.integer "daci_most_recent_transmission_to_contact_id"
    t.integer "this_subtype_last_daci_to_contact_id"
    t.integer "this_subtype_last_daci_to_contact_transmission_id"
    t.boolean "content_valid"
    t.text "content_errors", array: true
    t.text "precheck_errors", array: true
    t.index ["client_id"], name: "index_export_batch_items_on_client_id"
    t.index ["digital_asset_content_item_id"], name: "index_export_batch_items_on_digital_asset_content_item_id"
    t.index ["export_batch_id"], name: "index_export_batch_items_on_export_batch_id"
    t.index ["export_batchable_id", "export_batchable_type"], name: "index_export_batch_items_export_batchable"
  end

  create_table "export_batches", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.string "name", null: false
    t.string "comments"
    t.boolean "incremental", default: true
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_digital_asset_transfer_template_id"
    t.index ["client_id"], name: "index_export_batches_on_client_id"
    t.index ["contact_digital_asset_transfer_template_id"], name: "index_export_batches_transfer_template"
  end

  create_table "extent_types", id: :serial, force: :cascade do |t|
    t.string "value", limit: 255
    t.string "code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "extent_unit_id"
    t.index ["extent_unit_id"], name: "index_extent_types_on_extent_unit_id"
  end

  create_table "extent_units", id: :serial, force: :cascade do |t|
    t.integer "extent_type_id"
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "extent_unit_category_id"
    t.index ["extent_type_id"], name: "index_extent_units_on_extent_type_id"
    t.index ["extent_unit_category_id"], name: "index_extent_units_on_extent_unit_category_id"
  end

  create_table "extents", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "extent_type", limit: 255
    t.string "extent_value", limit: 255
    t.string "extent_unit", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "extent_type_id"
    t.integer "extent_unit_id"
    t.index ["book_id"], name: "index_extents_on_book_id"
    t.index ["client_id"], name: "index_extents_on_client_id"
    t.index ["extent_type_id"], name: "index_extents_on_extent_type_id"
    t.index ["extent_unit_id"], name: "index_extents_on_extent_unit_id"
    t.index ["user_id"], name: "index_extents_on_user_id"
  end

  create_table "file_amazon_kindle_sale_invoices", id: :serial, force: :cascade do |t|
    t.integer "upload_file_id"
    t.integer "row_number"
    t.date "invoice_date"
    t.string "invoice_number", limit: 255
    t.string "marketplace_currency", limit: 3
    t.decimal "marketplace_amount"
    t.decimal "foreign_exchange_rate"
    t.string "payment_currency_code", limit: 3
    t.decimal "converted_amount"
    t.datetime "created_at"
    t.index ["upload_file_id", "row_number"], name: "index_file_amazon_kindle_sale_invoices_id_number", unique: true
  end

  create_table "file_amazon_kindle_sales", id: :serial, force: :cascade do |t|
    t.integer "upload_file_id"
    t.integer "row_number"
    t.date "invoice_date"
    t.string "asin", limit: 255
    t.string "physical_isbn_10", limit: 255
    t.string "physical_isbn_13", limit: 255
    t.string "digital_isbn", limit: 255
    t.string "title", limit: 255
    t.string "author", limit: 255
    t.string "imprint", limit: 255
    t.string "format", limit: 255
    t.integer "units_purchased"
    t.integer "units_refunded"
    t.integer "net_units"
    t.integer "net_units_mtd"
    t.integer "adjustments_made"
    t.decimal "rrp"
    t.string "list_price_currency", limit: 3
    t.decimal "publisher_price"
    t.string "publisher_price_currency", limit: 3
    t.decimal "discount_percentage"
    t.decimal "payment_amount"
    t.string "payment_amount_currency", limit: 3
    t.datetime "created_at"
    t.index ["upload_file_id", "row_number"], name: "index_file_amazon_kindle_sales_on_upload_file_id_and_row_number", unique: true
  end

  create_table "file_epubdirect_sales", id: :serial, force: :cascade do |t|
    t.integer "upload_file_id"
    t.integer "row_number"
    t.string "report_id", limit: 255
    t.string "report_date_or_date_and_time", limit: 255
    t.string "message_function", limit: 255
    t.string "sales_report_type", limit: 255
    t.string "report_period_from", limit: 255
    t.string "report_period_to", limit: 255
    t.string "not_used", limit: 255
    t.string "reporting_price_type", limit: 255
    t.string "reporting_currency", limit: 255
    t.string "class_of_trade_or_sale", limit: 255
    t.string "sales_territory", limit: 255
    t.string "line_item_id", limit: 255
    t.string "subagent_id", limit: 255
    t.string "subagent_name", limit: 255
    t.string "transaction_date_or_date_and_time", limit: 255
    t.string "agents_transaction_id", limit: 255
    t.string "line_item_reference_type", limit: 255
    t.string "line_item_reference_id", limit: 255
    t.string "line_item_reference_datetime", limit: 255
    t.string "main_product_id_type", limit: 255
    t.string "main_product_id", limit: 255
    t.string "alternative_product_id_type", limit: 255
    t.string "alternative_product_id", limit: 255
    t.string "product_title", limit: 255
    t.string "product_authors", limit: 255
    t.string "product_description", limit: 255
    t.string "publisher_id", limit: 255
    t.string "publisher_name", limit: 255
    t.string "imprint_name", limit: 255
    t.string "product_format", limit: 255
    t.string "device_type", limit: 255
    t.string "gross_sold_quantity", limit: 255
    t.string "returned_or_refunded_quantity", limit: 255
    t.string "net_sold_quantity", limit: 255
    t.string "nonsale_quantity", limit: 255
    t.string "nonsale_disposal_type", limit: 255
    t.string "unit_price", limit: 255
    t.string "price_type", limit: 255
    t.string "price_currency", limit: 255
    t.string "commission_or_discount_percentage", limit: 255
    t.string "gross_sold_value", limit: 255
    t.string "returned_or_refunded_value", limit: 255
    t.string "net_value_before_fees", limit: 255
    t.string "fee_type_1", limit: 255
    t.string "fee_amount_1", limit: 255
    t.string "fee_source_1", limit: 255
    t.string "fee_type_2", limit: 255
    t.string "fee_amount_2", limit: 255
    t.string "fee_source_2", limit: 255
    t.string "fee_type_3", limit: 255
    t.string "fee_amount_3", limit: 255
    t.string "fee_source_3", limit: 255
    t.string "proceeds_of_sale_due_to_publisher", limit: 255
    t.string "total_number_of_line_items", limit: 255
    t.string "total_gross_sold_quantity", limit: 255
    t.string "total_returned_or_refunded_quantity", limit: 255
    t.string "total_net_sold_quantity", limit: 255
    t.string "total_nonsale_quantity", limit: 255
    t.string "total_gross_sold_value", limit: 255
    t.string "total_returned_or_refunded_value", limit: 255
    t.string "total_net_sold_value_before_fees", limit: 255
    t.string "total_fees_of_all_types", limit: 255
    t.string "total_proceeds_due_to_publisher", limit: 255
    t.string "reporting_agent_id", limit: 255
    t.string "reporting_agent_name", limit: 255
    t.string "currency_conversion_rate", limit: 255
    t.string "list_price", limit: 255
    t.index ["upload_file_id", "row_number"], name: "index_file_epubdirect_sales_on_upload_file_id_and_row_number"
  end

  create_table "file_marston_sales", id: :serial, force: :cascade do |t|
    t.integer "upload_file_id"
    t.integer "row_number"
    t.string "publisher", limit: 255
    t.string "profit_centre_code", limit: 255
    t.string "profit_centre", limit: 255
    t.string "isbn", limit: 255
    t.string "product", limit: 255
    t.string "product_and_isbn", limit: 255
    t.string "isbn_and_product", limit: 255
    t.string "answer_code", limit: 255
    t.string "answer_description", limit: 255
    t.string "author", limit: 255
    t.string "published_date", limit: 255
    t.string "statement_account", limit: 255
    t.string "account", limit: 255
    t.string "customer", limit: 255
    t.string "address_1", limit: 255
    t.string "address_2", limit: 255
    t.string "address_3", limit: 255
    t.string "address_4", limit: 255
    t.string "address_5", limit: 255
    t.string "address_6", limit: 255
    t.string "town", limit: 255
    t.string "post_code", limit: 255
    t.string "period", limit: 255
    t.string "transaction_date", limit: 255
    t.string "transaction_reference", limit: 255
    t.string "document_type", limit: 255
    t.string "transaction_type", limit: 255
    t.string "sale_type", limit: 255
    t.string "customer_reference", limit: 255
    t.string "credit_note_reason", limit: 255
    t.string "gratis_reason", limit: 255
    t.string "waste_reason", limit: 255
    t.string "market", limit: 255
    t.string "region_group", limit: 255
    t.string "region", limit: 255
    t.string "country", limit: 255
    t.string "area", limit: 255
    t.string "area_code", limit: 255
    t.string "pack_flag", limit: 255
    t.string "transaction_rep_code", limit: 255
    t.string "transaction_rep", limit: 255
    t.string "default_rep_code", limit: 255
    t.string "default_rep", limit: 255
    t.string "trade_direct", limit: 255
    t.string "override_address_id", limit: 255
    t.string "mailing_status", limit: 255
    t.string "email", limit: 255
    t.string "published_price", limit: 255
    t.string "cost_price", limit: 255
    t.string "cost_value", limit: 255
    t.string "published_value", limit: 255
    t.string "actual_discount_pct", limit: 255
    t.string "net_value", limit: 255
    t.string "ordered_quantity", limit: 255
    t.string "waste_quantity", limit: 255
    t.string "delivered_quantity", limit: 255
    t.string "order_source", limit: 255
    t.string "currency", limit: 255
    t.string "roe", limit: 255
    t.string "published_price_equivalent", limit: 255
    t.string "published_value_eqvuivalent", limit: 255
    t.string "net_value_equivalent", limit: 255
    t.string "mailshot_code", limit: 255
    t.string "customer_category_code", limit: 255
    t.string "distributor_customer_category", limit: 255
    t.string "publisher_category_code", limit: 255
    t.string "publisher_customer_category", limit: 255
    t.string "product_group_code", limit: 255
    t.string "product_group", limit: 255
    t.string "category_code", limit: 255
    t.string "category", limit: 255
    t.string "last_day", limit: 255
  end

  create_table "finance_code_allocations", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "finance_code_id"
    t.integer "finance_codeable_id"
    t.string "finance_codeable_type", limit: 255
    t.decimal "allocation"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["finance_code_id"], name: "index_finance_code_allocations_on_finance_code_id"
    t.index ["finance_codeable_id", "finance_codeable_type"], name: "index_finance_code_allocations_finance_codeable"
  end

  create_table "finance_codes", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.date "date_until"
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code_type", limit: 255
    t.boolean "include_in_auto_setup"
    t.integer "cost_group_id"
    t.decimal "default_cash_lead_time"
    t.integer "sequence_number"
    t.index ["client_id"], name: "index_finance_codes_on_client_id"
    t.index ["contact_id"], name: "index_finance_codes_on_contact_id"
    t.index ["cost_group_id", "id"], name: "index_finance_codes_on_cost_group_id_and_id"
    t.index ["cost_group_id"], name: "index_finance_codes_on_cost_group_id"
  end

  create_table "flipper_features", id: :serial, force: :cascade do |t|
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_flipper_features_on_key", unique: true
  end

  create_table "flipper_gates", id: :serial, force: :cascade do |t|
    t.string "feature_key", null: false
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_key", "key", "value"], name: "index_flipper_gates_on_feature_key_and_key_and_value", unique: true
  end

  create_table "foreignright_classifications", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "foreignright_id"
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foreignrights", id: :serial, force: :cascade do |t|
    t.string "language", limit: 255
    t.integer "work_id"
    t.integer "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "rightstype"
    t.integer "rightrule_id"
    t.integer "user_id"
    t.integer "client_id"
    t.date "double_tax_form_date_sent"
    t.date "double_tax_form_date_receieved"
    t.date "double_tax_form_sent_on"
    t.string "who_sent_forms", limit: 255
    t.integer "publisher"
    t.date "expiry_date"
    t.string "format", limit: 255
    t.string "agreement_stage", limit: 255
    t.integer "contracttemplate_id"
    t.date "signed_date"
    t.string "signatory", limit: 255
    t.string "territory", limit: 255
    t.string "contract_type", limit: 255
    t.string "contract_name", limit: 255
    t.date "pub_before_date"
    t.integer "free_copies"
    t.string "copyright_year", limit: 255
    t.string "type", limit: 255
    t.decimal "reserve"
    t.decimal "author_discount"
    t.string "remainder_rate", limit: 255
    t.date "ms_delivery_date"
    t.date "ms_proofs_date"
    t.date "review_date"
    t.date "terminated_date"
    t.string "termination_reason", limit: 255
    t.date "first_statement_date"
    t.string "statement_frequency", limit: 255
    t.integer "term"
    t.string "royalty_basis", limit: 255
    t.date "last_statement_date"
    t.decimal "flat_fee_value"
    t.decimal "guaranteed_royalty_value"
    t.integer "territories_excluded"
    t.integer "countries_included"
    t.integer "countries_excluded"
    t.string "first_print_qty", limit: 255
    t.string "retail_price", limit: 255
    t.boolean "sample_received"
    t.integer "agency_id"
    t.string "external_reference", limit: 255
    t.decimal "unit_price"
    t.string "incoterms", limit: 255
    t.integer "agency"
    t.string "coedition_price_currency", limit: 255
    t.decimal "file_fee_amount"
    t.string "file_fee_currency", limit: 255
    t.text "language_country", array: true
    t.text "text_script", array: true
    t.text "language_name", array: true
    t.index ["client_id"], name: "index_foreignrights_on_client_id"
    t.index ["contact_id"], name: "index_foreignrights_on_contributor_id"
    t.index ["rightrule_id"], name: "index_foreignrights_on_rightrule_id"
    t.index ["user_id"], name: "index_foreignrights_on_user_id"
    t.index ["work_id"], name: "index_foreignrights_on_work_id"
  end

  create_table "forem_categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 255
    t.index ["slug"], name: "index_forem_categories_on_slug", unique: true
  end

  create_table "forem_forums", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string "slug", limit: 255
    t.string "name", limit: 255
    t.index ["slug"], name: "index_forem_forums_on_slug", unique: true
  end

  create_table "forem_groups", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.index ["name"], name: "index_forem_groups_on_name"
  end

  create_table "forem_memberships", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.integer "member_id"
    t.index ["group_id"], name: "index_forem_memberships_on_group_id"
  end

  create_table "forem_moderator_groups", id: :serial, force: :cascade do |t|
    t.integer "forum_id"
    t.integer "group_id"
    t.index ["forum_id"], name: "index_forem_moderator_groups_on_forum_id"
  end

  create_table "forem_posts", id: :serial, force: :cascade do |t|
    t.integer "topic_id"
    t.text "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reply_to_id"
    t.string "state", limit: 255, default: "pending_review"
    t.boolean "notified", default: false
    t.index ["reply_to_id"], name: "index_forem_posts_on_reply_to_id"
    t.index ["state"], name: "index_forem_posts_on_state"
    t.index ["topic_id"], name: "index_forem_posts_on_topic_id"
    t.index ["user_id"], name: "index_forem_posts_on_user_id"
  end

  create_table "forem_subscriptions", id: :serial, force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", id: :serial, force: :cascade do |t|
    t.integer "forum_id"
    t.integer "user_id"
    t.string "subject", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "locked", default: false, null: false
    t.boolean "pinned", default: false
    t.boolean "hidden", default: false
    t.datetime "last_post_at"
    t.string "state", limit: 255, default: "pending_review"
    t.integer "views_count", default: 0
    t.string "slug", limit: 255
    t.index ["forum_id"], name: "index_forem_topics_on_forum_id"
    t.index ["slug"], name: "index_forem_topics_on_slug", unique: true
    t.index ["state"], name: "index_forem_topics_on_state"
    t.index ["user_id"], name: "index_forem_topics_on_user_id"
  end

  create_table "forem_views", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "count", default: 0
    t.string "viewable_type", limit: 255
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
    t.index ["updated_at"], name: "index_forem_views_on_updated_at"
    t.index ["user_id"], name: "index_forem_views_on_user_id"
    t.index ["viewable_id"], name: "index_forem_views_on_topic_id"
  end

  create_table "format_details", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.integer "format_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "format_id"
    t.integer "book_id"
    t.index ["book_id"], name: "index_format_details_on_book_id"
    t.index ["format_id"], name: "index_format_details_on_format_id"
    t.index ["format_type_id"], name: "index_format_details_on_format_type_id"
  end

  create_table "format_types", id: :serial, force: :cascade do |t|
    t.integer "format_id"
    t.integer "format_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["format_detail_id"], name: "index_format_types_on_format_detail_id"
    t.index ["format_id"], name: "index_format_types_on_format_id"
  end

  create_table "formats", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "format_detail_id"
    t.string "format_alias", limit: 255
    t.boolean "is_physical_product", default: true, null: false
    t.index ["format_detail_id"], name: "index_formats_on_format_detail_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "friend_type", limit: 255
  end

  create_table "ftp_template_connection_logs", id: :serial, force: :cascade do |t|
    t.integer "ftp_template_connection_id"
    t.integer "action_number"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "action", limit: 255
    t.text "response"
    t.index ["ftp_template_connection_id", "action_number"], name: "index_ftp_template_connection_logs_template_action"
  end

  create_table "ftp_template_connections", id: :serial, force: :cascade do |t|
    t.integer "ftp_template_id"
    t.integer "user_id"
    t.string "login_user", limit: 255
    t.string "login_password", limit: 255
    t.string "login_acct", limit: 255
    t.string "connect_host", limit: 255
    t.string "connect_port", limit: 255
    t.string "directory", limit: 255
    t.boolean "use_passive"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "error", limit: 255
    t.integer "ftps_mode", default: 0, null: false
    t.index ["ftp_template_id"], name: "index_ftp_template_connections_on_ftp_template_id"
  end

  create_table "ftp_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "contact_id"
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.string "login_user", limit: 255
    t.string "login_password", limit: 255
    t.string "login_acct", limit: 255
    t.string "connect_host", limit: 255
    t.string "connect_port", limit: 255
    t.boolean "use_passive"
    t.string "image_directory"
    t.integer "ftps_mode", default: 0, null: false
    t.index ["contact_id"], name: "index_ftp_templates_on_contact_id"
  end

  create_table "gratis_copies", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "contract_id", null: false
    t.integer "book_id"
    t.integer "contact_id"
    t.text "note"
    t.integer "number_of_copies"
    t.decimal "notional_cost"
    t.string "notional_cost_currency_code"
    t.date "send_on"
    t.date "sent_on"
    t.decimal "discount_percent"
    t.decimal "charge_amount"
    t.string "charge_currency_code", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "copy_tracker_created"
    t.index ["client_id"], name: "index_gratis_copies_on_client_id"
    t.index ["contact_id"], name: "index_gratis_copies_on_contact_id"
    t.index ["contract_id"], name: "index_gratis_copies_on_contract_id"
    t.index ["user_id"], name: "index_gratis_copies_on_user_id"
  end

  create_table "gritter_notices", id: :serial, force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "owner_type", limit: 255, null: false
    t.text "text", null: false
    t.text "options", null: false
    t.datetime "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "delivered_at"], name: "index_gritter_notices_on_owner_id_and_delivered_at"
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "head_rights", id: :integer, default: -> { "nextval('work_rights_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "client_id"
    t.integer "contract_id"
    t.boolean "sublicensable", default: true
    t.text "languages", default: [], array: true
    t.boolean "languages_exclude", default: true
    t.text "scripts", default: [], array: true
    t.boolean "scripts_exclude", default: true
    t.text "rights_types", default: [], array: true
    t.text "territories", default: [], array: true
    t.boolean "territories_exclude", default: true
    t.date "date_from"
    t.date "date_to"
    t.integer "passed_to_id"
    t.integer "pass_type"
    t.integer "user_id"
    t.boolean "rights_types_exclude", default: false
    t.integer "work_editions", default: [], null: false, array: true
    t.boolean "shared_rights", default: false, null: false
    t.index ["client_id"], name: "index_work_rights_on_client_id"
    t.index ["contract_id"], name: "index_work_rights_on_work_id"
  end

  create_table "help_contents", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "system_content"
    t.text "content"
    t.text "heading"
    t.string "helpable_type", limit: 255
    t.integer "helpable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "helps", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_name", limit: 255
    t.index ["client_id"], name: "index_helps_on_client_id"
    t.index ["user_id"], name: "index_helps_on_user_id"
  end

  create_table "homes", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identifiable_onix_identifier_types", id: :serial, force: :cascade do |t|
    t.string "value", limit: 255
    t.string "onix_identifiable_type", limit: 255
    t.integer "onix_identifiable_id"
    t.string "identifier_type_name", limit: 255
    t.string "identifier_value", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id", "identifier_value"], name: "index_identifiable_onix_identifier_types_client_value"
    t.index ["onix_identifiable_id", "onix_identifiable_type", "value"], name: "index_identifiable_onix_identifier_types_identifiable_value", unique: true
  end

  create_table "import_cells", id: :serial, force: :cascade do |t|
    t.integer "import_table_id"
    t.integer "row_index"
    t.integer "column_index"
    t.text "contents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["import_table_id"], name: "index_import_cells_on_import_table_id"
  end

  create_table "import_errors", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "error_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "import_tables", id: :serial, force: :cascade do |t|
    t.string "original_path", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.index ["client_id"], name: "index_import_tables_on_client_id"
  end

  create_table "importadvancecsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_importadvancecsvs_on_client_id"
    t.index ["user_id"], name: "index_importadvancecsvs_on_user_id"
  end

  create_table "importadvances", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.float "advance_value"
    t.string "trigger", limit: 255
    t.string "payee", limit: 255
    t.date "paid_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contract_id"
    t.integer "advance_id"
    t.index ["advance_id"], name: "index_importadvances_on_advance_id"
    t.index ["contract_id"], name: "index_importadvances_on_contract_id"
  end

  create_table "importeditioncsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importeditions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "publisher", limit: 255
    t.string "imprint", limit: 255
    t.text "title"
    t.text "subtitle"
    t.string "ed_no", limit: 255
    t.string "vol_no", limit: 255
    t.text "series_title"
    t.text "series_desc"
    t.string "print_isbn", limit: 255
    t.string "pdf_isbn", limit: 255
    t.string "epub_isbn", limit: 255
    t.decimal "usd_price"
    t.decimal "gbp_price"
    t.string "creator_one", limit: 255
    t.string "creator_one_type", limit: 255
    t.string "creator_two", limit: 255
    t.string "creator_two_type", limit: 255
    t.string "creator_three", limit: 255
    t.string "creator_three_type", limit: 255
    t.text "contrib_statement"
    t.date "on_sale_date"
    t.date "copyright_date"
    t.text "short_desc"
    t.text "long_desc"
    t.text "contents"
    t.text "reviews"
    t.string "bisac_one", limit: 255
    t.string "bisac_two", limit: 255
    t.string "bisac_three", limit: 255
    t.string "bic_one", limit: 255
    t.string "bic_two", limit: 255
    t.string "bic_three", limit: 255
    t.string "language", limit: 255
    t.string "pages", limit: 255
    t.text "geog_rights"
    t.string "copyright_holder", limit: 255
    t.string "royalty", limit: 255
    t.text "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "format", limit: 255
    t.string "height", limit: 255
    t.string "width", limit: 255
    t.integer "creator_1_id"
    t.integer "creator_2_id"
    t.integer "creator_3_id"
    t.string "avail", limit: 255
    t.integer "item_code_id"
    t.integer "author_id"
    t.text "review_quote"
    t.text "long_quote"
    t.string "review_author", limit: 255
    t.string "review_pub", limit: 255
    t.text "review_url"
    t.string "link_name", limit: 255
    t.text "link_url"
    t.string "interview", limit: 255
    t.string "pdf_price_gbp", limit: 255
    t.string "pdf_price_usd", limit: 255
    t.string "epub_price_gbp", limit: 255
    t.string "epub_price_usd", limit: 255
    t.string "supplier", limit: 255
    t.string "sheet_type_name", limit: 255
    t.string "geog_rights_excl", limit: 255
    t.string "isbn", limit: 255
  end

  create_table "importgeneralcsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importisbncsvs", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "csv_content_type", limit: 255
    t.string "csv_file_name", limit: 255
    t.string "csv_file_size", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importisbns", id: :serial, force: :cascade do |t|
    t.string "isbn", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importisbnxlsxes", id: :serial, force: :cascade do |t|
    t.string "xlsx_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "xslx_content_type", limit: 255
    t.integer "xlsx_file_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importmainordercsvs", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.string "csv_file_name", limit: 255
    t.integer "csv_file_size"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importmainorders", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "company", limit: 255
    t.string "currency", limit: 255
    t.string "date", limit: 255
    t.string "del_date", limit: 255
    t.string "discount", limit: 255
    t.string "ex", limit: 255
    t.string "imprint", limit: 255
    t.string "invoice", limit: 255
    t.string "isbn", limit: 255
    t.string "ponumber", limit: 255
    t.string "printerprice", limit: 255
    t.integer "quantity"
    t.text "title"
    t.string "title_prefix", limit: 255
    t.string "to_rec", limit: 255
    t.string "total", limit: 255
    t.string "unit_price", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importpaymentcsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_importpaymentcsvs_on_client_id"
    t.index ["user_id"], name: "index_importpaymentcsvs_on_user_id"
  end

  create_table "importpayments", id: :serial, force: :cascade do |t|
    t.string "payee", limit: 255
    t.float "payment_value"
    t.date "date"
    t.string "payment_method", limit: 255
    t.string "payment_ref", limit: 255
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "payment_id"
    t.integer "contract_id"
    t.index ["contract_id"], name: "index_importpayments_on_contract_id"
    t.index ["payment_id"], name: "index_importpayments_on_payment_id"
  end

  create_table "importpostcsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.integer "csv_file_size"
    t.string "title", limit: 255
    t.string "status", limit: 255
    t.text "body"
    t.text "extended_bod"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
    t.date "go_live_date"
    t.index ["client_id"], name: "index_importpostcsvs_on_client_id"
    t.index ["company_id"], name: "index_importpostcsvs_on_company_id"
    t.index ["original_id"], name: "index_importpostcsvs_on_original_id"
    t.index ["user_id"], name: "index_importpostcsvs_on_user_id"
  end

  create_table "importposts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "title", limit: 255
    t.string "status", limit: 255
    t.text "body"
    t.text "extended_bod"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "original_id"
    t.date "go_live_date"
    t.index ["client_id"], name: "index_importposts_on_client_id"
    t.index ["company_id"], name: "index_importposts_on_company_id"
    t.index ["original_id"], name: "index_importposts_on_original_id"
    t.index ["user_id"], name: "index_importposts_on_user_id"
  end

  create_table "importpurchasecsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_importpurchasecsvs_on_client_id"
    t.index ["user_id"], name: "index_importpurchasecsvs_on_user_id"
  end

  create_table "importpurchases", id: :serial, force: :cascade do |t|
    t.string "inv", limit: 255
    t.string "title", limit: 255
    t.string "isbn10", limit: 255
    t.string "isbn13", limit: 255
    t.integer "purchase_quantity"
    t.string "purchase_value", limit: 255
    t.string "supplier", limit: 255
    t.date "invoice_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "importrules", id: :serial, force: :cascade do |t|
    t.float "first_rate"
    t.integer "first_upper"
    t.float "second_rate"
    t.integer "second_upper"
    t.float "third_rate"
    t.integer "third_upper"
    t.string "channel", limit: 255
    t.string "contributor", limit: 255
    t.string "isbn", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "importsalecsvs", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.integer "csv_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "customer", limit: 255
    t.string "invoice", limit: 255
    t.integer "period_id"
    t.integer "expectedsale_id"
    t.integer "contact_id"
    t.index ["client_id"], name: "index_importsalecsvs_on_client_id"
    t.index ["contact_id"], name: "index_importsalecsvs_on_contact_id"
    t.index ["expectedsale_id"], name: "index_importsalecsvs_on_expectedsale_id"
    t.index ["period_id"], name: "index_importsalecsvs_on_period_id"
    t.index ["user_id"], name: "index_importsalecsvs_on_user_id"
  end

  create_table "importsales", id: :serial, force: :cascade do |t|
    t.string "isbn", limit: 255
    t.date "date"
    t.integer "sale_quantity"
    t.string "sale_value", limit: 255
    t.string "channel", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "masterchannel", limit: 255
    t.string "customer", limit: 255
    t.string "invoice", limit: 255
    t.integer "period_id"
    t.integer "expectedsale_id"
    t.integer "contact_id"
    t.integer "currency_id"
    t.integer "client_id"
    t.string "currencycode", limit: 255
    t.index ["client_id"], name: "index_importsales_on_client_id"
    t.index ["contact_id"], name: "index_importsales_on_contact_id"
    t.index ["currency_id"], name: "index_importsales_on_currency_id"
    t.index ["expectedsale_id"], name: "index_importsales_on_expectedsale_id"
    t.index ["period_id"], name: "index_importsales_on_period_id"
  end

  create_table "importukexportcontactparsers", id: :serial, force: :cascade do |t|
    t.string "publication", limit: 255
    t.string "firstname", limit: 255
    t.string "title", limit: 255
    t.string "position", limit: 255
    t.string "street", limit: 255
    t.string "city", limit: 255
    t.string "postcode", limit: 255
    t.string "phone", limit: 255
    t.string "fax", limit: 255
    t.string "email", limit: 255
    t.string "updated", limit: 255
    t.string "lastname", limit: 255
    t.string "contact_full_name", limit: 255
    t.text "fulladdress"
    t.text "notes"
    t.string "website", limit: 255
    t.text "materials"
    t.text "samples"
    t.text "interest"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importukexportcontacts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "csv_content_type", limit: 255
    t.string "csv_file_name", limit: 255
    t.integer "csv_file_size"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importwatkinscontacts", id: :serial, force: :cascade do |t|
    t.string "contact_first_name", limit: 255
    t.string "contact_last_name", limit: 255
    t.string "company_name", limit: 255
    t.text "address"
    t.string "email", limit: 255
    t.string "position", limit: 255
    t.string "postal_address", limit: 255
    t.string "phone", limit: 255
    t.string "fax", limit: 255
    t.string "mobile", limit: 255
    t.string "mod_date", limit: 255
    t.string "catalogue", limit: 255
    t.string "country", limit: 255
    t.text "materials_sent"
    t.text "notes"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imprint_monthly_stock_writedowns", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "imprint_id", null: false
    t.integer "month_no", null: false
    t.decimal "writedown_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imprints", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.string "image_file_size", limit: 255
    t.string "image_meta", limit: 255
    t.integer "work_id"
    t.integer "ai_template_id"
    t.string "website", limit: 255
    t.string "first_contact_line1", limit: 255
    t.string "first_contact_line2", limit: 255
    t.string "first_contact_line3", limit: 255
    t.string "second_contact_line1", limit: 255
    t.string "second_contact_line2", limit: 255
    t.string "second_contact_line3", limit: 255
    t.integer "origination_amortisation_months"
    t.decimal "default_shipment_lead_time"
    t.integer "default_printer_contact_id"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.integer "publishername_id"
    t.integer "sale_cashflow_monthly_profile_id"
    t.integer "default_role_set_id"
    t.string "default_cover_content_type", limit: 255
    t.string "default_cover_file_name", limit: 255
    t.integer "default_cover_file_size"
    t.string "default_cover_fingerprint", limit: 255
    t.string "publication_country", limit: 3
    t.string "publication_city", limit: 255
    t.string "isni", limit: 19
    t.integer "marketing_highlight_work_ids", default: [], array: true
    t.integer "press_release_id"
    t.index ["client_id"], name: "index_imprints_on_client_id"
    t.index ["monthly_sale_profile_id"], name: "index_imprints_on_monthly_sale_profile_id"
    t.index ["publishername_id"], name: "index_imprints_on_publishername_id"
    t.index ["returns_monthly_profile_id"], name: "index_imprints_on_returns_monthly_profile_id"
    t.index ["user_id"], name: "index_imprints_on_user_id"
  end

  create_table "installations", id: :serial, force: :cascade do |t|
    t.string "configuration_item", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "isbnimporters", id: :serial, force: :cascade do |t|
    t.text "paste_field"
    t.integer "imprint_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "isbnlists", id: :serial, force: :cascade do |t|
    t.string "used", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "number", limit: 255
    t.integer "book_id"
    t.string "imprint", limit: 255
    t.index ["client_id", "number"], name: "index_isbnlists_on_client_id_and_number"
    t.index ["client_id"], name: "index_isbnlists_on_client_id"
    t.index ["user_id"], name: "index_isbnlists_on_user_id"
  end

  create_table "issue_contacts", id: :serial, force: :cascade do |t|
    t.integer "issue_id", null: false
    t.integer "contact_id", null: false
    t.datetime "created_at", null: false
    t.index ["contact_id", "issue_id"], name: "index_issue_contacts_on_contact_id_and_issue_id", unique: true
    t.index ["issue_id", "contact_id"], name: "index_issue_contacts_on_issue_id_and_contact_id", unique: true
  end

  create_table "issue_logs", id: :serial, force: :cascade do |t|
    t.integer "issue_id", null: false
    t.integer "user_id", null: false
    t.text "description", null: false
    t.boolean "system_generated", null: false
    t.datetime "created_at", null: false
    t.index ["issue_id", "user_id"], name: "index_issue_logs_on_issue_id_and_user_id"
    t.index ["user_id", "issue_id"], name: "index_issue_logs_on_user_id_and_issue_id"
  end

  create_table "issues", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "work_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "raised_by_user_id"
    t.integer "assigned_to_user_id"
    t.date "date_assigned"
    t.integer "domain"
    t.integer "priority", null: false
    t.integer "severity", null: false
    t.date "resolution_deadline_date"
    t.date "resolution_date"
    t.integer "status", null: false
    t.text "resolution"
    t.text "notes"
    t.boolean "system_generated", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["assigned_to_user_id"], name: "index_issues_on_assigned_to_user_id"
    t.index ["client_id"], name: "index_issues_on_client_id"
    t.index ["raised_by_user_id"], name: "index_issues_on_raised_by_user_id"
    t.index ["work_id"], name: "index_issues_on_work_id"
  end

  create_table "keywords", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.string "keywordable_type", limit: 255
    t.integer "keywordable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_keywords_on_client_id"
    t.index ["keywordable_id", "keywordable_type"], name: "index_keywords_on_keywordable_id_and_keywordable_type"
  end

  create_table "languages", id: :serial, force: :cascade do |t|
    t.string "language_role", limit: 255
    t.string "language_code", limit: 255
    t.string "country_code", limit: 255
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_id"
    t.index ["book_id"], name: "index_languages_on_book_id"
  end

  create_table "levels", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.boolean "display", default: true
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "levelusers", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["level_id"], name: "index_levelusers_on_level_id"
    t.index ["user_id"], name: "index_levelusers_on_user_id"
  end

  create_table "licensed_rights", id: :serial, force: :cascade do |t|
    t.string "right_type", limit: 255
    t.float "author_cut"
    t.integer "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "client_id"
    t.index ["contract_id"], name: "index_righttypes_on_contract_id"
    t.index ["user_id"], name: "index_righttypes_on_user_id"
  end

  create_table "lifecycledates", id: :serial, force: :cascade do |t|
    t.integer "lifecycleable_id", null: false
    t.string "lifecycleable_type", limit: 255, null: false
    t.string "phase_name", limit: 255, null: false
    t.date "forecast_start_date"
    t.date "actual_start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lifecycleable_id", "lifecycleable_type", "phase_name"], name: "index_lifecycledates_unique"
    t.index ["phase_name", "actual_start_date", "forecast_start_date"], name: "index_lifecycledates_name_and_dates"
  end

  create_table "line_items", id: :serial, force: :cascade do |t|
    t.integer "order_id"
    t.integer "client_id"
    t.integer "user_id"
    t.decimal "quantity"
    t.decimal "value"
    t.integer "currency_id"
    t.string "description", limit: 255
    t.integer "book_id"
    t.integer "print_id"
    t.decimal "sales_tax_rate"
    t.decimal "price"
    t.integer "position"
    t.string "item_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spend_authorisation_id"
    t.integer "fake_money_id"
  end

  create_table "local_production_files", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "location"
    t.integer "work_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locks", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "attr_class_name", limit: 255
    t.string "attr_name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "obj_id"
    t.index ["obj_id"], name: "index_locks_on_obj_id"
  end

  create_table "logins", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "company_id"
    t.string "login_name", limit: 255
    t.string "password", limit: 255
    t.string "login_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.string "ftp_name", limit: 255
    t.date "valid_start_date"
    t.date "valid_end_date"
    t.boolean "include_in_upload"
    t.index ["client_id"], name: "index_logins_on_client_id"
    t.index ["company_id"], name: "index_logins_on_company_id"
    t.index ["contact_id"], name: "index_logins_on_contact_id"
    t.index ["user_id"], name: "index_logins_on_user_id"
  end

  create_table "mailing_lists", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_representations", id: :serial, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "agent_id", null: false
    t.string "agent_role", null: false
    t.text "countries", default: [], null: false, array: true
    t.text "countries_excluded", default: [], null: false, array: true
    t.text "territories", default: [], null: false, array: true
    t.integer "excluded_proprietary_format_description_ids", default: [], null: false, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "epub_type_codes", default: [], null: false, array: true
    t.text "product_forms", default: [], null: false, array: true
    t.index ["agent_id"], name: "index_market_representations_on_agent_id"
    t.index ["client_id"], name: "index_market_representations_on_client_id"
  end

  create_table "marketing_items", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_marketing_items_on_client_id"
  end

  create_table "marketing_material_templates", id: :serial, force: :cascade do |t|
    t.string "about", limit: 255
    t.string "author", limit: 255
    t.string "biblio", limit: 255
    t.text "blurb"
    t.integer "contact_id"
    t.integer "distributor_id"
    t.text "footer"
    t.text "header"
    t.string "image_file_name", limit: 255
    t.integer "marketing_id"
    t.integer "sales_id"
    t.integer "client_id"
    t.integer "user_id"
    t.string "design_name", limit: 255
    t.string "template_name", limit: 255
    t.string "text_color", limit: 255
    t.string "other_color", limit: 255
    t.string "default", limit: 255
    t.string "page_size", limit: 255
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marketingtexts", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "text_type", limit: 255
    t.text "marketing_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "legacy_code", limit: 255
    t.string "legacy_code_note", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "soft_delete"
    t.string "rating", limit: 255
    t.date "date_posted"
    t.boolean "exclude_from_onix"
    t.date "date_published"
    t.date "date_released"
    t.date "publication"
    t.integer "contact_id"
    t.text "pull_quote"
    t.text "review_url"
    t.integer "publisher_id"
    t.string "main_type"
    t.text "alternate_marketing_text"
    t.text "alternate_pull_quote"
    t.string "publication_name"
    t.boolean "marketing_text_use_wysiwyg_editor", default: false, null: false
    t.boolean "alternate_marketing_text_use_wysiwyg_editor", default: false, null: false
    t.boolean "pull_quote_use_wysiwyg_editor", default: false, null: false
    t.boolean "alternate_pull_quote_use_wysiwyg_editor", default: false, null: false
    t.date "from_date"
    t.date "until_date"
    t.integer "approval_status", default: 0
    t.index ["book_id"], name: "index_marketingtexts_on_book_id"
    t.index ["client_id"], name: "index_marketingtexts_on_client_id"
    t.index ["user_id"], name: "index_marketingtexts_on_user_id"
    t.index ["work_id"], name: "index_marketingtexts_on_work_id"
  end

  create_table "masterchannel_product_forms", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "masterchannel_id", null: false
    t.string "product_form", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["masterchannel_id", "product_form"], name: "index_masterchannel_product_forms_mc_form"
    t.index ["product_form", "masterchannel_id"], name: "index_masterchannel_product_forms_form_mc", unique: true
  end

  create_table "masterchannels", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "masterchannel_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "inc_product_forms", default: [], null: false, array: true
    t.text "exc_product_forms", default: [], null: false, array: true
    t.string "sales_type", default: "Product", null: false
    t.string "code"
    t.index ["client_id"], name: "index_masterchannels_on_client_id"
    t.index ["user_id"], name: "index_masterchannels_on_user_id"
  end

  create_table "masterrules", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "first_lower"
    t.integer "first_upper"
    t.integer "second_lower"
    t.integer "second_upper"
    t.integer "third_lower"
    t.integer "third_upper"
    t.integer "fourth_lower"
    t.integer "fourth_upper"
    t.integer "fifth_lower"
    t.integer "fifth_upper"
    t.integer "masterchannel_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contract_id"
    t.index ["book_id"], name: "index_masterrules_on_book_id"
    t.index ["client_id"], name: "index_masterrules_on_client_id"
    t.index ["contract_id"], name: "index_masterrules_on_contract_id"
    t.index ["masterchannel_id"], name: "index_masterrules_on_masterchannel_id"
    t.index ["user_id"], name: "index_masterrules_on_user_id"
  end

  create_table "measurement_types", id: :serial, force: :cascade do |t|
    t.integer "measurement_unit_id"
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["measurement_unit_id"], name: "index_measurement_types_on_measurement_unit_id"
  end

  create_table "measurement_units", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "measure_type", limit: 255
    t.string "measurement", limit: 255
    t.string "measure_unit", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "measurement_type_id"
    t.integer "measurement_unit_id"
    t.integer "proprietary_format_description_id"
    t.index ["book_id"], name: "index_measurements_on_book_id"
    t.index ["client_id"], name: "index_measurements_on_client_id"
    t.index ["measurement_type_id"], name: "index_measurements_on_measurement_type_id"
    t.index ["measurement_unit_id"], name: "index_measurements_on_measurement_unit_id"
    t.index ["user_id"], name: "index_measurements_on_user_id"
  end

  create_table "money", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "money_type", limit: 255
    t.string "tax_rate_code", limit: 255
    t.decimal "tax_rate_percent"
    t.decimal "tax_value"
    t.integer "user_id"
    t.date "valid_from"
    t.date "valid_until"
    t.integer "currency_id"
    t.string "moneyable_type", limit: 255
    t.integer "moneyable_id"
    t.decimal "quantity"
    t.string "quantity_unit", limit: 255
    t.decimal "money_amount"
    t.decimal "base_currency_amount"
    t.string "moneysourceable_type", limit: 255
    t.integer "moneysourceable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["moneyable_id", "moneyable_type"], name: "index_money_on_moneyable_id_and_moneyable_type"
    t.index ["moneysourceable_id", "moneysourceable_type"], name: "index_money_on_moneysourceable_id_and_moneysourceable_type"
  end

  create_table "money_nonuniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "client_id"
    t.string "money_type", limit: 255
    t.string "tax_rate_code", limit: 255
    t.decimal "tax_rate_percent"
    t.decimal "tax_value"
    t.integer "user_id"
    t.date "valid_from"
    t.date "valid_until"
    t.integer "currency_id"
    t.string "moneyable_type", limit: 255
    t.integer "moneyable_id"
    t.decimal "quantity"
    t.string "quantity_unit", limit: 255
    t.decimal "money_amount"
    t.decimal "base_currency_amount"
    t.string "moneysourceable_type", limit: 255
    t.integer "moneysourceable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
  end

  create_table "money_uniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "client_id"
    t.string "money_type", limit: 255
    t.string "tax_rate_code", limit: 255
    t.decimal "tax_rate_percent"
    t.decimal "tax_value"
    t.integer "user_id"
    t.date "valid_from"
    t.date "valid_until"
    t.integer "currency_id"
    t.string "moneyable_type", limit: 255
    t.integer "moneyable_id"
    t.decimal "quantity"
    t.string "quantity_unit", limit: 255
    t.decimal "money_amount"
    t.decimal "base_currency_amount"
    t.string "moneysourceable_type", limit: 255
    t.integer "moneysourceable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
  end

  create_table "monthly_sale_profiles", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.text "description"
    t.integer "client_id", null: false
    t.integer "user_id", default: 0, null: false
    t.decimal "month_01_factor", default: "0.0", null: false
    t.decimal "month_02_factor", default: "0.0", null: false
    t.decimal "month_03_factor", default: "0.0", null: false
    t.decimal "month_04_factor", default: "0.0", null: false
    t.decimal "month_05_factor", default: "0.0", null: false
    t.decimal "month_06_factor", default: "0.0", null: false
    t.decimal "month_07_factor", default: "0.0", null: false
    t.decimal "month_08_factor", default: "0.0", null: false
    t.decimal "month_09_factor", default: "0.0", null: false
    t.decimal "month_10_factor", default: "0.0", null: false
    t.decimal "month_11_factor", default: "0.0", null: false
    t.decimal "month_12_factor", default: "0.0", null: false
    t.decimal "month_13_factor", default: "0.0", null: false
    t.decimal "month_14_factor", default: "0.0", null: false
    t.decimal "month_15_factor", default: "0.0", null: false
    t.decimal "month_16_factor", default: "0.0", null: false
    t.decimal "month_17_factor", default: "0.0", null: false
    t.decimal "month_18_factor", default: "0.0", null: false
    t.decimal "month_19_factor", default: "0.0", null: false
    t.decimal "month_20_factor", default: "0.0", null: false
    t.decimal "month_21_factor", default: "0.0", null: false
    t.decimal "month_22_factor", default: "0.0", null: false
    t.decimal "month_23_factor", default: "0.0", null: false
    t.decimal "month_24_factor", default: "0.0", null: false
    t.decimal "month_25_factor", default: "0.0", null: false
    t.decimal "month_26_factor", default: "0.0", null: false
    t.decimal "month_27_factor", default: "0.0", null: false
    t.decimal "month_28_factor", default: "0.0", null: false
    t.decimal "month_29_factor", default: "0.0", null: false
    t.decimal "month_30_factor", default: "0.0", null: false
    t.decimal "month_31_factor", default: "0.0", null: false
    t.decimal "month_32_factor", default: "0.0", null: false
    t.decimal "month_33_factor", default: "0.0", null: false
    t.decimal "month_34_factor", default: "0.0", null: false
    t.decimal "month_35_factor", default: "0.0", null: false
    t.decimal "month_36_factor", default: "0.0", null: false
    t.integer "last_month_specified", default: 0, null: false
    t.decimal "total_factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_count", default: 0
    t.integer "channels_count", default: 0
    t.integer "book_channels_count", default: 0
    t.integer "imprints_count", default: 0
    t.integer "companies_count", default: 0
    t.integer "publishers_count", default: 0
    t.integer "estimates_count", default: 0
    t.decimal "month_37_factor", default: "0.0", null: false
    t.decimal "month_38_factor", default: "0.0", null: false
    t.decimal "month_39_factor", default: "0.0", null: false
    t.decimal "month_40_factor", default: "0.0", null: false
    t.decimal "month_41_factor", default: "0.0", null: false
    t.decimal "month_42_factor", default: "0.0", null: false
    t.decimal "month_43_factor", default: "0.0", null: false
    t.decimal "month_44_factor", default: "0.0", null: false
    t.decimal "month_45_factor", default: "0.0", null: false
    t.decimal "month_46_factor", default: "0.0", null: false
    t.decimal "month_47_factor", default: "0.0", null: false
    t.decimal "month_48_factor", default: "0.0", null: false
    t.decimal "month_49_factor", default: "0.0", null: false
    t.decimal "month_50_factor", default: "0.0", null: false
    t.decimal "month_51_factor", default: "0.0", null: false
    t.decimal "month_52_factor", default: "0.0", null: false
    t.decimal "month_53_factor", default: "0.0", null: false
    t.decimal "month_54_factor", default: "0.0", null: false
    t.decimal "month_55_factor", default: "0.0", null: false
    t.decimal "month_56_factor", default: "0.0", null: false
    t.decimal "month_57_factor", default: "0.0", null: false
    t.decimal "month_58_factor", default: "0.0", null: false
    t.decimal "month_59_factor", default: "0.0", null: false
    t.decimal "month_60_factor", default: "0.0", null: false
    t.index ["client_id"], name: "index_monthly_sale_profiles_on_client_id"
  end

  create_table "ms_delivery_dates", id: :serial, force: :cascade do |t|
    t.integer "contract_id"
    t.date "date_due"
    t.text "delivery_requirement"
    t.decimal "percentage_of_total"
    t.string "deliverable_type", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contracttemplate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "slipped_date"
  end

  create_table "non_book_parents", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "non_books", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "private"
    t.text "note_text"
    t.date "expires"
    t.integer "contact_id"
    t.string "subject_line", limit: 255
    t.integer "notable_id"
    t.string "notable_type", limit: 255
    t.integer "reply_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry", limit: 255
    t.index ["ancestry"], name: "index_notes_on_ancestry"
  end

  create_table "notices", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "delayed_job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.text "link_to_follow"
    t.string "status_of_job", limit: 255
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "message"
    t.integer "notifyable_id"
    t.string "notifyable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_nonces", id: :serial, force: :cascade do |t|
    t.string "nonce", limit: 255
    t.integer "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nonce", "timestamp"], name: "index_oauth_nonces_on_nonce_and_timestamp", unique: true
  end

  create_table "oauth_tokens", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "type", limit: 20
    t.integer "client_application_id"
    t.string "token", limit: 40
    t.string "secret", limit: 40
    t.string "callback_url", limit: 255
    t.string "verifier", limit: 20
    t.string "scope", limit: 255
    t.datetime "authorized_at"
    t.datetime "invalidated_at"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_oauth_tokens_on_token", unique: true
  end

  create_table "onix_code_lists", id: false, force: :cascade do |t|
    t.integer "list_number"
    t.text "list_description"
    t.integer "list_issue_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "onix_codes", id: :serial, force: :cascade do |t|
    t.integer "list_number"
    t.string "value", limit: 255
    t.text "description"
    t.text "notes"
    t.integer "issue_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "string1", limit: 255
    t.index ["list_number", "value"], name: "index_onix_codes_on_list_number_and_value"
  end

  create_table "onixarchives", id: :serial, force: :cascade do |t|
    t.string "xml_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "sent_to_nielsen"
    t.date "sent_to_bowker"
    t.date "sent_to_amazoncouk"
    t.date "sent_to_bds"
    t.date "sent_to_gardners"
    t.index ["client_id"], name: "index_onixarchives_on_client_id"
    t.index ["user_id"], name: "index_onixarchives_on_user_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "ref", limit: 255
    t.integer "book_id"
    t.date "date_placed"
    t.integer "estimate_id"
    t.integer "contact_id"
    t.date "date_required"
    t.string "order_type", limit: 255
    t.string "payment_terms_in_days", limit: 255
    t.decimal "currency_id"
    t.date "written_off_date"
    t.string "status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "purchase_order", limit: 255
    t.string "invoice_number", limit: 255
    t.integer "channel_id"
    t.integer "print_id"
    t.index ["book_id", "order_type"], name: "index_orders_on_book_id_and_order_type"
    t.index ["book_id"], name: "index_orders_on_book_id"
    t.index ["channel_id"], name: "index_orders_on_channel_id"
    t.index ["contact_id"], name: "index_orders_on_contact_id"
    t.index ["estimate_id"], name: "index_orders_on_estimate_id"
    t.index ["print_id"], name: "index_orders_on_print_id"
  end

  create_table "pages", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paper_stock_bundles", id: :serial, force: :cascade do |t|
    t.integer "paper_stock_id"
    t.integer "paper_stockable_id"
    t.string "paper_stockable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paper_stock_id"], name: "index_paper_stock_bundles_on_paper_stock_id"
    t.index ["paper_stockable_id", "paper_stockable_type"], name: "index_paper_stock_bundles_stockable"
  end

  create_table "paper_stocks", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.decimal "gsm"
    t.decimal "micron"
    t.string "paper_stock_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_paper_stocks_on_client_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.float "payment_value"
    t.date "date"
    t.integer "contract_id"
    t.string "payment_type", limit: 255
    t.string "payment_method", limit: 255
    t.date "cleared_date"
    t.integer "contact_id"
    t.string "currency", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "advance_id"
    t.integer "client_id"
    t.integer "foreignright_id"
    t.float "tax_rate"
    t.float "tax_value"
    t.string "payment_reference", limit: 255
    t.integer "user_id"
    t.integer "receipt_id"
    t.integer "royarchive_id"
    t.boolean "created_through_royalty_process", default: false
    t.integer "alternative_payee_id"
    t.index ["advance_id"], name: "index_payments_on_advance_id"
    t.index ["alternative_payee_id"], name: "index_payments_on_alternative_payee_id"
    t.index ["book_id"], name: "index_payments_on_book_id"
    t.index ["client_id"], name: "index_payments_on_client_id"
    t.index ["contact_id"], name: "index_payments_on_contributor_id"
    t.index ["contract_id"], name: "index_payments_on_contract_id"
    t.index ["foreignright_id"], name: "index_payments_on_foreignright_id"
    t.index ["receipt_id"], name: "index_payments_on_receipt_id"
    t.index ["royarchive_id"], name: "index_payments_on_royarchive_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "periodactives", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_periodactives_on_client_id"
    t.index ["period_id"], name: "index_periodactives_on_period_id"
    t.index ["user_id"], name: "index_periodactives_on_user_id"
  end

  create_table "periods", id: :serial, force: :cascade do |t|
    t.date "startdate"
    t.date "enddate"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "currentperiod"
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "main_period"
    t.index ["client_id"], name: "index_periods_on_client_id"
    t.index ["user_id"], name: "index_periods_on_user_id"
  end

  create_table "permissions", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.integer "contact_id"
    t.text "description"
    t.string "status", limit: 255
    t.date "date_start"
    t.date "date_end"
    t.string "type_of_permission", limit: 255
    t.integer "work_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type", limit: 255
    t.index ["book_id"], name: "index_permissions_on_book_id"
    t.index ["contact_id"], name: "index_permissions_on_contact_id"
    t.index ["work_id"], name: "index_permissions_on_work_id"
  end

  create_table "pg_search_documents", id: :serial, force: :cascade do |t|
    t.text "content"
    t.integer "searchable_id"
    t.string "searchable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_id", "searchable_type"], name: "index_pg_search_documents_searchable"
  end

  create_table "phones", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "phone_type", limit: 255
    t.string "phone_number", limit: 255
    t.integer "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.index ["address_id"], name: "index_phones_on_address_id"
    t.index ["client_id"], name: "index_phones_on_client_id"
    t.index ["contact_id"], name: "index_phones_on_contributor_id"
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.text "header"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipelines", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.string "dealable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "private"
    t.boolean "archive"
    t.index ["client_id"], name: "index_pipelines_on_client_id"
  end

  create_table "ports", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.string "inco", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_ports_on_client_id"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "title", limit: 255
    t.string "status", limit: 255
    t.boolean "allow_comments"
    t.text "body"
    t.text "extended_body"
    t.text "excerpt"
    t.string "keywords", limit: 255
    t.string "category", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.date "go_live_date"
    t.integer "original_id"
    t.string "author_name", limit: 255
    t.integer "comments_count", default: 0, null: false
    t.index ["client_id", "status", "created_at"], name: "index_posts_on_client_id_and_status_and_created_at"
    t.index ["client_id"], name: "index_posts_on_client_id"
    t.index ["company_id"], name: "index_posts_on_company_id"
    t.index ["original_id"], name: "index_posts_on_original_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "preferences", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "setting_name", limit: 255
    t.text "setting_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "price_value_defaults", id: :serial, force: :cascade do |t|
    t.integer "price_defaultable_id"
    t.string "price_defaultable_type", limit: 255
    t.integer "client_id"
    t.string "price_type", limit: 255
    t.decimal "price_amount"
    t.string "tax_rate_code", limit: 255
    t.decimal "tax_rate_percent"
    t.decimal "taxable_amount"
    t.decimal "tax_value"
    t.string "discount_code_type", limit: 255
    t.string "discount_code", limit: 255
    t.integer "currency_id"
    t.string "onix_price_type_qualifier_id", limit: 255
    t.text "type_description"
    t.string "unit_of_pricing", limit: 255
    t.integer "minimum_order_quantity"
    t.string "discount_code_type_name", limit: 255
    t.string "status_code", limit: 255
    t.index ["client_id"], name: "index_price_value_defaults_on_client_id"
    t.index ["price_defaultable_id", "price_defaultable_type"], name: "index_price_value_defaults_price_defaultable"
  end

  create_table "prices", id: :serial, force: :cascade do |t|
    t.string "price_type", limit: 255
    t.decimal "price_amount"
    t.string "tax_rate_code", limit: 255
    t.decimal "tax_rate_percent"
    t.string "currency_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "taxable_amount"
    t.decimal "tax_value"
    t.string "discount_code_type", limit: 255
    t.string "discount_code", limit: 255
    t.integer "supplydetail_id"
    t.boolean "defaultprice", default: false, null: false
    t.integer "client_id"
    t.integer "user_id"
    t.date "valid_until"
    t.integer "currency_id"
    t.integer "book_id"
    t.string "onix_price_type_qualifier_id", limit: 255
    t.text "type_description"
    t.string "unit_of_pricing", limit: 255, default: "00"
    t.integer "minimum_order_quantity", default: 1
    t.date "price_effective_from"
    t.date "price_effective_to"
    t.string "discount_code_type_name", limit: 255
    t.string "status_code", limit: 2, default: "00", null: false
    t.string "tax_rate_code_2", limit: 255
    t.decimal "tax_rate_percent_2"
    t.decimal "taxable_amount_2"
    t.decimal "tax_value_2"
    t.text "countries", array: true
    t.text "territories", array: true
    t.text "countries_excluded", array: true
    t.text "territories_excluded", array: true
    t.index ["book_id"], name: "index_prices_on_book_id"
    t.index ["client_id"], name: "index_prices_on_client_id"
  end

  create_table "print_binding_details", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "binding_type_id"
    t.text "description"
    t.decimal "width_of_board"
    t.string "type_of_board", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
    t.text "binding_instructions"
    t.integer "print_bundle_component_id"
    t.string "page_binding_method", limit: 255
    t.string "trimming_method", limit: 255
    t.string "endpapers", limit: 255
    t.string "case_spine_style", limit: 255
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_binding_details_on_print_bundle_component_id"
  end

  create_table "print_bundle_components", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
    t.index ["client_id"], name: "index_print_bundle_components_on_client_id"
    t.index ["print_id"], name: "index_print_bundle_components_on_print_id"
  end

  create_table "print_bundle_components_printer_estimates", id: :serial, force: :cascade do |t|
    t.integer "print_bundle_component_id"
    t.integer "printer_estimate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_bundle_component_id"], name: "index_print_bundle_components_printer_estimates_comp"
    t.index ["printer_estimate_id"], name: "index_print_bundle_components_printer_estimates_est"
  end

  create_table "print_costing_print_binding_details", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_binding_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_binding_detail_id"], name: "index_print_costing_print_binding_details_binding_detail"
    t.index ["print_costing_id"], name: "index_print_costing_print_binding_details_costing"
  end

  create_table "print_costing_print_cover_details", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_cover_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_print_cover_details_costing"
  end

  create_table "print_costing_print_embellishments", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_embellishment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_print_embellishments_costing"
    t.index ["print_embellishment_id"], name: "index_print_costing_print_embellishments_embellishment"
  end

  create_table "print_costing_print_originations", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_origination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_print_originations_costing"
    t.index ["print_origination_id"], name: "index_print_costing_print_originations_origination"
  end

  create_table "print_costing_print_paper_details", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_paper_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_print_paper_details_costing"
    t.index ["print_paper_detail_id"], name: "index_print_costing_print_paper_details_paper_detail"
  end

  create_table "print_costing_print_parts", id: :serial, force: :cascade do |t|
    t.integer "print_costing_id"
    t.integer "print_part_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_print_parts_costing"
    t.index ["print_part_id"], name: "index_print_costing_print_parts_part"
  end

  create_table "print_costing_simple_print_prices", id: :serial, force: :cascade do |t|
    t.integer "simple_print_price_id"
    t.integer "print_costing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_costing_simple_print_prices_cost"
    t.index ["simple_print_price_id"], name: "index_print_costing_simple_print_prices_id"
  end

  create_table "print_costings", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "print_item_cost_centre_id"
    t.integer "print_id"
    t.string "status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "contact_id"
    t.boolean "delivery_quote"
    t.boolean "origination_quote"
    t.string "estimate_reference", limit: 255
    t.text "customer_to_supply"
    t.text "supplier_to_do"
    t.text "terms"
    t.date "valid_until"
    t.date "invite_sent"
    t.string "username", limit: 255
    t.string "password", limit: 255
    t.date "tender_deadline"
  end

  create_table "print_cover_details", id: :serial, force: :cascade do |t|
    t.integer "print_item_id"
    t.string "cover_type", limit: 255
    t.integer "cover_supplier"
    t.string "cover_material", limit: 255
    t.string "cover_colours_outside", limit: 255
    t.string "cover_colours_outside_type", limit: 255
    t.text "cover_colours_outside_description"
    t.string "cover_colours_inside", limit: 255
    t.decimal "cover_paper_gsm"
    t.text "cover_route"
    t.boolean "cover_material_supplied"
    t.text "cover_notes"
    t.text "cover_print_instructions"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
    t.integer "user_id"
    t.boolean "proofs"
    t.string "proof_type", limit: 255
    t.integer "print_bundle_component_id"
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_cover_details_on_print_bundle_component_id"
  end

  create_table "print_embellishments", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
    t.integer "user_id"
    t.boolean "proofs"
    t.string "proof_type", limit: 255
    t.integer "print_bundle_component_id"
    t.integer "print_binding_detail_id"
    t.string "uuid"
    t.index ["print_binding_detail_id"], name: "index_print_embellishments_on_print_binding_detail_id"
    t.index ["print_bundle_component_id"], name: "index_print_embellishments_on_print_bundle_component_id"
    t.index ["print_id"], name: "index_print_embellishments_on_print_id"
  end

  create_table "print_finish_types", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.string "name", null: false
    t.index ["client_id"], name: "index_print_finish_types_on_client_id"
  end

  create_table "print_finishes", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.text "description"
    t.string "ref", limit: 255
    t.integer "print_cover_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "proof_type", limit: 255
    t.integer "print_bundle_component_id"
    t.integer "print_id"
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_finishes_on_print_bundle_component_id"
  end

  create_table "print_item_cost_centres", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "contact_id"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_print_item_cost_centres_on_client_id"
    t.index ["contact_id"], name: "index_print_item_cost_centres_on_contact_id"
  end

  create_table "print_item_print_item_cost_centres", id: :serial, force: :cascade do |t|
    t.integer "print_item_id"
    t.integer "print_item_cost_centre_id"
    t.decimal "percent"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "chargeable_id"
    t.string "chargeable_type", limit: 255
    t.index ["chargeable_id", "chargeable_type"], name: "index_print_item_print_item_cost_centres_charge"
    t.index ["print_item_cost_centre_id"], name: "index_print_item_print_item_cost_centres_codt"
    t.index ["print_item_id"], name: "index_print_item_print_item_cost_centres_on_print_item_id"
  end

  create_table "print_items", id: :serial, force: :cascade do |t|
    t.string "print_item_category", limit: 255
    t.integer "print_id"
    t.integer "client_id"
    t.integer "user_id"
    t.text "description"
    t.string "name", limit: 255
    t.decimal "unit_cost"
    t.integer "currency"
    t.integer "unit_quantity"
    t.decimal "fixed_cost"
    t.integer "contact_id"
    t.string "status", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "printquotable_id"
    t.string "printquotable_type", limit: 255
    t.integer "print_costing_id"
    t.integer "upper_quantity_threshold"
    t.integer "lower_quantity_threshold"
    t.integer "currency_id"
    t.integer "run_on_upper_limit"
    t.decimal "run_on_unit_price"
    t.date "valid_until"
    t.boolean "simple_pricing"
    t.index ["contact_id"], name: "index_print_items_on_contact_id"
    t.index ["print_costing_id"], name: "index_print_items_on_print_costing_id"
    t.index ["print_id"], name: "index_print_items_on_print_id"
    t.index ["printquotable_id", "printquotable_type"], name: "index_print_items_on_printquotable_id_and_printquotable_type"
  end

  create_table "print_nonuniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "highway_job_id"
    t.string "order_status", limit: 255
    t.string "job_status", limit: 255
    t.string "printer", limit: 255
    t.integer "highway_printer_id"
    t.integer "mis_id"
    t.string "customer_code", limit: 255
    t.string "input_by", limit: 255
    t.string "previous_job_no", limit: 255
    t.string "text_material_description", limit: 255
    t.string "text_material_gsm", limit: 255
    t.string "fsc", limit: 255
    t.boolean "halftones_integrated"
    t.boolean "bleeds"
    t.string "text_colour", limit: 255
    t.string "text_colour_description", limit: 255
    t.string "text_material_supplied", limit: 255
    t.string "text_notes", limit: 255
    t.string "head_margin", limit: 255
    t.string "back_margin", limit: 255
    t.string "sixty_four_pp_sections", limit: 255
    t.string "ninety_six_pp_sections", limit: 255
    t.string "full_reel", limit: 255
    t.string "half_reel", limit: 255
    t.string "full_reel_allocation", limit: 255
    t.string "half_reel_allocation", limit: 255
    t.string "bind_net_qty", limit: 255
    t.string "print_net_qty", limit: 255
    t.string "packing_format", limit: 255
    t.boolean "plate_section"
    t.string "edition_no", limit: 255
    t.string "book_type", limit: 255
    t.string "description", limit: 255
    t.string "impression", limit: 255
    t.string "cover_type", limit: 255
    t.string "cover_supplier", limit: 255
    t.string "cover_material", limit: 255
    t.string "cover_colours_outside", limit: 255
    t.string "cover_colours_outside_type", limit: 255
    t.string "cover_colours_outside_description", limit: 255
    t.string "cover_colours_inside", limit: 255
    t.string "cover_paper_gsm", limit: 255
    t.boolean "emboss"
    t.boolean "spot_gloss"
    t.string "lamination", limit: 255
    t.boolean "stickers"
    t.boolean "bellybands"
    t.boolean "blocking"
    t.boolean "backing"
    t.boolean "hollow"
    t.boolean "brasses"
    t.boolean "head_tail_bands"
    t.boolean "ribbons"
    t.boolean "endpapers"
    t.string "cover_route", limit: 255
    t.string "cover_material_supplied", limit: 255
    t.string "cover_notes", limit: 255
    t.string "cover_print_instructions", limit: 255
    t.string "job_type", limit: 255
    t.string "poref", limit: 255
    t.string "customer_contact", limit: 255
    t.string "general_notes", limit: 255
    t.string "edition_qty", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "order_sent"
    t.integer "work_id"
    t.date "delivery_date"
    t.integer "carton_quantity"
    t.decimal "weight_per_carton"
    t.integer "cartons_per_pallet"
    t.integer "mono_transparencies"
    t.integer "colour_transparencies"
    t.integer "mono_prints"
    t.integer "colour_prints"
    t.integer "mono_flat_artwork"
    t.integer "colour_flat_artwork"
    t.integer "mono_digital_artwork"
    t.integer "colour_digital_artwork"
    t.text "pre_scanning_order"
    t.text "main_repro_order"
    t.text "repro_corrections_order"
    t.integer "estimate_id"
    t.boolean "simple_pricing"
    t.integer "shipment_id"
    t.decimal "total_shipment_cost"
    t.decimal "shipping_cost_budget"
  end

  create_table "print_on_demand_specs", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "printer_contact_id"
    t.string "name", limit: 255
    t.string "currency_code", limit: 3
    t.decimal "estimated_setup_cost"
    t.decimal "actual_setup_cost"
    t.decimal "estimated_unit_cost"
    t.decimal "actual_unit_cost"
    t.date "setup_date"
    t.integer "pp_override"
    t.integer "width_override"
    t.integer "height_override"
    t.string "measurement_units", limit: 255
    t.boolean "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "active_from_date"
    t.date "active_until_date"
    t.boolean "content_sent_to_printer", default: false
    t.date "content_sent_to_printer_date"
    t.decimal "estimated_pp_cost"
    t.decimal "actual_pp_cost"
    t.decimal "estimated_total_cost"
    t.decimal "actual_total_cost"
    t.boolean "for_all_suppliers"
    t.integer "order_days"
    t.index ["book_id"], name: "index_print_on_demand_specs_on_book_id"
    t.index ["client_id"], name: "index_print_on_demand_specs_on_client_id"
    t.index ["printer_contact_id"], name: "index_print_on_demand_specs_on_printer_contact_id"
  end

  create_table "print_originations", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "print_id"
    t.string "name", limit: 255
    t.string "film_spec_type", limit: 255
    t.string "type_of_proof", limit: 255
    t.boolean "multiple_proofs"
    t.integer "extent"
    t.string "item_type", limit: 255
    t.string "status_code", limit: 255
    t.integer "indexer"
    t.integer "paratext"
    t.string "output_or_correction", limit: 255
    t.integer "supportingresource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "originationable_id"
    t.string "originationable_type", limit: 255
    t.integer "print_bundle_component_id"
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_originations_on_print_bundle_component_id"
  end

  create_table "print_paper_details", id: :serial, force: :cascade do |t|
    t.integer "text_extent"
    t.string "text_colour", limit: 255
    t.string "text_colour_description", limit: 255
    t.boolean "text_material_supplied"
    t.string "text_notes", limit: 255
    t.boolean "halftones_integrated"
    t.decimal "bleeds"
    t.decimal "head_margin"
    t.decimal "back_margin"
    t.string "sixty_four_pp_sections", limit: 255
    t.string "ninety_six_pp_sections", limit: 255
    t.string "full_reel", limit: 255
    t.string "half_reel", limit: 255
    t.string "full_reel_allocation", limit: 255
    t.string "half_reel_allocation", limit: 255
    t.string "bind_net_qty", limit: 255
    t.string "print_net_qty", limit: 255
    t.string "packing_format", limit: 255
    t.boolean "plate_section"
    t.string "text_material_description", limit: 255
    t.decimal "text_material_gsm"
    t.boolean "fsc"
    t.string "base_finish", limit: 255
    t.string "name", limit: 255
    t.text "description"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "text_material_microns", limit: 255
    t.text "text_print_instructions"
    t.string "head_trim", limit: 255
    t.boolean "proofs"
    t.string "proof_type", limit: 255
    t.integer "print_bundle_component_id"
    t.integer "specifiable_id"
    t.string "specifiable_type", limit: 255
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_paper_details_on_print_bundle_component_id"
    t.index ["specifiable_id", "specifiable_type"], name: "index_print_paper_details_specifiable"
  end

  create_table "print_part_items", id: :serial, force: :cascade do |t|
    t.integer "print_part_id"
    t.string "name", limit: 255
    t.text "description"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_part_id"], name: "index_print_part_items_on_print_part_id"
  end

  create_table "print_parts", id: :serial, force: :cascade do |t|
    t.integer "print_id"
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.text "materials_supplied"
    t.text "specs"
    t.text "packing"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "proof_type", limit: 255
    t.integer "print_bundle_component_id"
    t.string "uuid"
    t.index ["print_bundle_component_id"], name: "index_print_parts_on_print_bundle_component_id"
  end

  create_table "print_print_costings", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "print_costing_id"
    t.integer "print_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_costing_id"], name: "index_print_print_costings_on_print_costing_id"
    t.index ["print_id"], name: "index_print_print_costings_on_print_id"
  end

  create_table "print_shipping_rates", id: :serial, force: :cascade do |t|
    t.integer "shipping_rate_id"
    t.integer "print_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["print_id"], name: "index_print_shipping_rates_on_print_id"
    t.index ["shipping_rate_id"], name: "index_print_shipping_rates_on_shipping_rate_id"
  end

  create_table "print_uniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "highway_job_id"
    t.string "order_status", limit: 255
    t.string "job_status", limit: 255
    t.string "printer", limit: 255
    t.integer "highway_printer_id"
    t.integer "mis_id"
    t.string "customer_code", limit: 255
    t.string "input_by", limit: 255
    t.string "previous_job_no", limit: 255
    t.string "text_material_description", limit: 255
    t.string "text_material_gsm", limit: 255
    t.string "fsc", limit: 255
    t.boolean "halftones_integrated"
    t.boolean "bleeds"
    t.string "text_colour", limit: 255
    t.string "text_colour_description", limit: 255
    t.string "text_material_supplied", limit: 255
    t.string "text_notes", limit: 255
    t.string "head_margin", limit: 255
    t.string "back_margin", limit: 255
    t.string "sixty_four_pp_sections", limit: 255
    t.string "ninety_six_pp_sections", limit: 255
    t.string "full_reel", limit: 255
    t.string "half_reel", limit: 255
    t.string "full_reel_allocation", limit: 255
    t.string "half_reel_allocation", limit: 255
    t.string "bind_net_qty", limit: 255
    t.string "print_net_qty", limit: 255
    t.string "packing_format", limit: 255
    t.boolean "plate_section"
    t.string "edition_no", limit: 255
    t.string "book_type", limit: 255
    t.string "description", limit: 255
    t.string "impression", limit: 255
    t.string "cover_type", limit: 255
    t.string "cover_supplier", limit: 255
    t.string "cover_material", limit: 255
    t.string "cover_colours_outside", limit: 255
    t.string "cover_colours_outside_type", limit: 255
    t.string "cover_colours_outside_description", limit: 255
    t.string "cover_colours_inside", limit: 255
    t.string "cover_paper_gsm", limit: 255
    t.boolean "emboss"
    t.boolean "spot_gloss"
    t.string "lamination", limit: 255
    t.boolean "stickers"
    t.boolean "bellybands"
    t.boolean "blocking"
    t.boolean "backing"
    t.boolean "hollow"
    t.boolean "brasses"
    t.boolean "head_tail_bands"
    t.boolean "ribbons"
    t.boolean "endpapers"
    t.string "cover_route", limit: 255
    t.string "cover_material_supplied", limit: 255
    t.string "cover_notes", limit: 255
    t.string "cover_print_instructions", limit: 255
    t.string "job_type", limit: 255
    t.string "poref", limit: 255
    t.string "customer_contact", limit: 255
    t.string "general_notes", limit: 255
    t.string "edition_qty", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "order_sent"
    t.integer "work_id"
    t.date "delivery_date"
    t.integer "carton_quantity"
    t.decimal "weight_per_carton"
    t.integer "cartons_per_pallet"
    t.integer "mono_transparencies"
    t.integer "colour_transparencies"
    t.integer "mono_prints"
    t.integer "colour_prints"
    t.integer "mono_flat_artwork"
    t.integer "colour_flat_artwork"
    t.integer "mono_digital_artwork"
    t.integer "colour_digital_artwork"
    t.text "pre_scanning_order"
    t.text "main_repro_order"
    t.text "repro_corrections_order"
    t.integer "estimate_id"
    t.boolean "simple_pricing"
    t.integer "shipment_id"
    t.decimal "total_shipment_cost"
    t.decimal "shipping_cost_budget"
  end

  create_table "printer_estimates", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
    t.integer "user_id"
    t.string "estimate_reference", limit: 255
    t.date "valid_until"
    t.text "customer_to_supply"
    t.text "supplier_to_do"
    t.text "terms"
    t.boolean "accepted"
    t.date "pdf_file_to_printer"
    t.index ["client_id"], name: "index_printer_estimates_on_client_id"
    t.index ["contact_id", "accepted"], name: "index_printer_estimates_on_contact_id_and_accepted"
    t.index ["print_id", "accepted"], name: "index_printer_estimates_on_print_id_and_accepted"
  end

  create_table "printer_estimates_nonuniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "contact_id"
    t.integer "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "print_id"
    t.integer "user_id"
    t.string "estimate_reference", limit: 255
    t.date "valid_until"
    t.text "customer_to_supply"
    t.text "supplier_to_do"
    t.text "terms"
    t.boolean "accepted"
  end

  create_table "printer_estimates_uniq", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "contact_id"
    t.integer "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "print_id"
    t.integer "user_id"
    t.string "estimate_reference", limit: 255
    t.date "valid_until"
    t.text "customer_to_supply"
    t.text "supplier_to_do"
    t.text "terms"
    t.boolean "accepted"
  end

  create_table "prints", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.integer "highway_job_id"
    t.string "order_status", limit: 255
    t.string "job_status", limit: 255
    t.string "printer", limit: 255
    t.integer "highway_printer_id"
    t.integer "mis_id"
    t.string "customer_code", limit: 255
    t.string "input_by", limit: 255
    t.string "previous_job_no", limit: 255
    t.string "text_material_description", limit: 255
    t.string "text_material_gsm", limit: 255
    t.string "fsc", limit: 255
    t.boolean "halftones_integrated"
    t.boolean "bleeds"
    t.string "text_colour", limit: 255
    t.string "text_colour_description", limit: 255
    t.string "text_material_supplied", limit: 255
    t.string "text_notes", limit: 255
    t.string "head_margin", limit: 255
    t.string "back_margin", limit: 255
    t.string "sixty_four_pp_sections", limit: 255
    t.string "ninety_six_pp_sections", limit: 255
    t.string "full_reel", limit: 255
    t.string "half_reel", limit: 255
    t.string "full_reel_allocation", limit: 255
    t.string "half_reel_allocation", limit: 255
    t.string "bind_net_qty", limit: 255
    t.string "print_net_qty", limit: 255
    t.string "packing_format", limit: 255
    t.boolean "plate_section"
    t.string "edition_no", limit: 255
    t.string "book_type", limit: 255
    t.string "description", limit: 255
    t.string "impression", limit: 255
    t.string "cover_type", limit: 255
    t.string "cover_supplier", limit: 255
    t.string "cover_material", limit: 255
    t.string "cover_colours_outside", limit: 255
    t.string "cover_colours_outside_type", limit: 255
    t.string "cover_colours_outside_description", limit: 255
    t.string "cover_colours_inside", limit: 255
    t.string "cover_paper_gsm", limit: 255
    t.boolean "emboss"
    t.boolean "spot_gloss"
    t.string "lamination", limit: 255
    t.boolean "stickers"
    t.boolean "bellybands"
    t.boolean "blocking"
    t.boolean "backing"
    t.boolean "hollow"
    t.boolean "brasses"
    t.boolean "head_tail_bands"
    t.boolean "ribbons"
    t.boolean "endpapers"
    t.string "cover_route", limit: 255
    t.string "cover_material_supplied", limit: 255
    t.string "cover_notes", limit: 255
    t.string "cover_print_instructions", limit: 255
    t.string "job_type", limit: 255
    t.string "poref", limit: 255
    t.string "customer_contact", limit: 255
    t.text "general_notes"
    t.string "edition_qty", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "order_sent"
    t.integer "work_id"
    t.date "delivery_date"
    t.integer "carton_quantity"
    t.decimal "weight_per_carton"
    t.integer "cartons_per_pallet"
    t.integer "mono_transparencies"
    t.integer "colour_transparencies"
    t.integer "mono_prints"
    t.integer "colour_prints"
    t.integer "mono_flat_artwork"
    t.integer "colour_flat_artwork"
    t.integer "mono_digital_artwork"
    t.integer "colour_digital_artwork"
    t.text "pre_scanning_order"
    t.text "main_repro_order"
    t.text "repro_corrections_order"
    t.integer "estimate_id"
    t.boolean "simple_pricing"
    t.integer "shipment_id"
    t.decimal "total_shipment_cost"
    t.decimal "shipping_cost_budget"
    t.index ["book_id"], name: "index_prints_on_book_id"
    t.index ["client_id"], name: "index_prints_on_client_id"
    t.index ["highway_job_id"], name: "index_prints_on_highway_job_id"
    t.index ["highway_printer_id"], name: "index_prints_on_highway_printer_id"
    t.index ["mis_id"], name: "index_prints_on_mis_id"
    t.index ["user_id"], name: "index_prints_on_user_id"
    t.index ["work_id"], name: "index_prints_on_work_id"
  end

  create_table "prizes", id: :serial, force: :cascade do |t|
    t.string "prize_name", limit: 255
    t.integer "prize_year"
    t.string "prize_country", limit: 255
    t.string "prize_code", limit: 255
    t.text "prize_jury"
    t.string "display_as", limit: 255
    t.integer "client_id"
    t.integer "work_id"
    t.integer "user_id"
    t.boolean "all_books"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id", "work_id"], name: "index_prizes_on_client_id_and_work_id"
    t.index ["work_id"], name: "index_prizes_on_work_id"
  end

  create_table "product_parts", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "container_id", null: false
    t.integer "contained_id", null: false
    t.integer "number_of_copies", default: 1, null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "sequence_number"
    t.string "part_name"
    t.index ["contained_id", "container_id"], name: "index_product_parts_on_contained_id_and_container_id", unique: true
    t.index ["container_id", "contained_id"], name: "index_product_parts_on_container_id_and_contained_id", unique: true
  end

  create_table "product_titles", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "title", limit: 255
    t.string "prefix", limit: 255
    t.text "subtitle"
    t.string "title_type", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distributor_contact_id"
    t.index ["distributor_contact_id"], name: "index_product_titles_on_distributor_contact_id"
  end

  create_table "productcodes", id: :serial, force: :cascade do |t|
    t.string "idtype", limit: 255
    t.string "idvalue", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_productcodes_on_book_id"
    t.index ["client_id"], name: "index_productcodes_on_client_id"
    t.index ["user_id"], name: "index_productcodes_on_user_id"
  end

  create_table "production_files", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment_file_name", limit: 255
    t.string "attachment_content_type", limit: 255
    t.integer "attachment_file_size"
    t.string "file_type", limit: 255
    t.string "attachment_fingerprint"
    t.index ["work_id"], name: "index_production_files_on_work_id"
  end

  create_table "professional_affiliations", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "contributor_id", null: false
    t.integer "organisation_id"
    t.string "organisation_name"
    t.string "professional_position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_professional_affiliations_on_client_id"
    t.index ["contributor_id"], name: "index_professional_affiliations_on_contributor_id"
    t.index ["organisation_id"], name: "index_professional_affiliations_on_organisation_id"
  end

  create_table "profitarchives", id: :serial, force: :cascade do |t|
    t.string "csv_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_profitarchives_on_client_id"
    t.index ["user_id"], name: "index_profitarchives_on_user_id"
  end

  create_table "progress_bars", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "message", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_attachments", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "file_file_name", limit: 255
    t.string "file_content_type", limit: 255
    t.string "file_file_size", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "project_id"
  end

  create_table "project_contents", id: :serial, force: :cascade do |t|
    t.string "project_containable_type", limit: 255
    t.integer "project_containable_id"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_containable_id", "project_containable_type", "project_id"], name: "index_project_contents_containable_project_id"
    t.index ["project_id", "project_containable_id", "project_containable_type"], name: "index_project_contents_project_id_containable"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "type", limit: 255
    t.boolean "private"
    t.integer "project_manager_id"
    t.date "planned_start_date"
    t.date "expected_start_date"
    t.date "actual_start_date"
    t.date "planned_end_date"
    t.date "expected_end_date"
    t.date "actual_end_date"
    t.integer "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "phase", default: 1
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["project_manager_id"], name: "index_projects_on_project_manager_id"
  end

  create_table "proposal_texts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "body"
    t.text "heading"
    t.integer "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["work_id"], name: "index_proposal_texts_on_work_id"
  end

  create_table "proprietary_age_ranges", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "sequence", limit: 255
    t.index ["client_id", "sequence"], name: "index_proprietary_age_ranges_on_client_id_and_sequence"
  end

  create_table "proprietary_edition_description_proprietary_format_descriptions", id: :integer, default: -> { "nextval('proprietary_edition_description_proprietary_format_descr_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "proprietary_edition_description_id"
    t.integer "proprietary_format_description_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proprietary_edition_description_id"], name: "index_proprietary_edition_description_pfd_e"
    t.index ["proprietary_format_description_id"], name: "index_proprietary_edition_description_pfd_f"
  end

  create_table "proprietary_edition_descriptions", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code", limit: 255
    t.integer "proprietary_format_description_id"
    t.integer "sequence"
    t.integer "books_count", default: 0
    t.integer "default_role_set_id"
    t.boolean "rights_edition"
    t.index ["client_id"], name: "index_proprietary_edition_descriptions_on_client_id"
  end

  create_table "proprietary_format_descriptions", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "format_id"
    t.integer "format_detail_id"
    t.integer "books_count", default: 0
    t.string "epub_type_code", limit: 255
    t.string "epub_type_version", limit: 255
    t.string "epub_type_description", limit: 255
    t.string "epub_format_code", limit: 255
    t.string "epub_format_version", limit: 255
    t.string "epub_format_description", limit: 255
    t.string "epub_source_code", limit: 255
    t.string "epub_source_version", limit: 255
    t.string "epub_source_description", limit: 255
    t.string "epub_type_note", limit: 255
    t.string "product_form", limit: 255
    t.text "product_form_detail", array: true
    t.string "feature_colour_of_cover", limit: 255
    t.string "feature_colour_of_page_edge", limit: 255
    t.string "feature_text_font", limit: 255
    t.string "feature_special_cover_material", limit: 255
    t.string "feature_dvd_region", limit: 255
    t.string "feature_epub_accessibility", limit: 255
    t.string "feature_cpsia_choking_hazard_warning", limit: 255
    t.string "feature_eu_toy_safety_hazard_warning", limit: 255
    t.text "feature_paper_environmental_statement"
    t.string "product_packaging", limit: 255
    t.text "product_form_description"
    t.integer "number_of_pieces"
    t.string "trade_category", limit: 255
    t.text "product_content_type", array: true
    t.integer "map_scales", array: true
    t.text "description"
    t.decimal "page_trim_height_mm"
    t.decimal "page_trim_height_in"
    t.decimal "page_trim_width_mm"
    t.decimal "page_trim_width_in"
    t.decimal "product_height_mm"
    t.decimal "product_height_in"
    t.decimal "product_width_mm"
    t.decimal "product_width_in"
    t.decimal "product_thickness_mm"
    t.decimal "product_thickness_in"
    t.decimal "unit_weight_gr"
    t.decimal "unit_weight_oz"
    t.decimal "spherical_diameter_mm"
    t.decimal "spherical_diameter_in"
    t.decimal "cylindrical_diameter_mm"
    t.decimal "cylindrical_diameter_in"
    t.decimal "sheet_height_mm"
    t.decimal "sheet_height_in"
    t.decimal "sheet_width_mm"
    t.decimal "sheet_width_in"
    t.decimal "rolled_sheet_package_side_mm"
    t.decimal "rolled_sheet_package_side_in"
    t.index ["client_id"], name: "index_proprietary_format_descriptions_on_client_id"
  end

  create_table "proprietary_price_ranges", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.string "sequence", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "from_price"
    t.decimal "to_price"
    t.index ["client_id"], name: "index_proprietary_price_ranges_on_client_id"
  end

  create_table "publishernames", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "publisher_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "returns_monthly_profile_id"
    t.integer "monthly_sale_profile_id"
    t.integer "sale_cashflow_monthly_profile_id"
    t.integer "origination_amortisation_months"
    t.string "publication_country", limit: 3
    t.string "publication_city", limit: 255
    t.string "isni", limit: 19
    t.string "deutsche_nationalbibliothek_identifier"
    t.string "borsenverein_verkehrsnummer"
    t.string "german_isbn_agency_publisher_identifier"
    t.string "global_location_number"
    t.string "standard_address_number"
    t.string "centraal_boekhuis_relatie_identifier"
    t.string "fondscode_boekenbank"
    t.string "y_tunnus"
    t.string "personennamendatei"
    t.string "japanese_publisher_identifier"
    t.string "gemeinsame_korperschaftsdatei"
    t.string "gapp_publisher_identifier"
    t.string "gemeinsame_normdatei"
    t.string "dunn_and_bradstreet_universal_numbering_system"
    t.string "ringgold_id"
    t.string "identifiant_editeur_electre"
    t.index ["client_id"], name: "index_publishernames_on_client_id"
    t.index ["user_id"], name: "index_publishernames_on_user_id"
  end

  create_table "publishing_fees", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "contact_id", null: false
    t.integer "contract_id", null: false
    t.boolean "offset_against_royalties", default: false, null: false
    t.string "fee_name"
    t.decimal "fee_amt", null: false
    t.date "due_date"
    t.decimal "paid_amt", default: "0.0", null: false
    t.date "paid_date"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_publishing_fees_on_client_id"
    t.index ["contact_id", "contract_id"], name: "index_publishing_fees_on_contact_id_and_contract_id"
    t.index ["contract_id", "contact_id"], name: "index_publishing_fees_on_contract_id_and_contact_id"
  end

  create_table "publishing_roles", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "publishable_type", null: false
    t.integer "publishable_id", null: false
    t.string "publishing_role_code", limit: 2, null: false
    t.integer "contact_id", null: false
    t.datetime "created_at", null: false
    t.integer "user_id"
    t.index ["client_id"], name: "index_publishing_roles_on_client_id"
    t.index ["contact_id", "publishable_id", "publishing_role_code", "publishable_type"], name: "index_publishing_role_contact_publishable", unique: true
    t.index ["publishable_id", "publishable_type", "publishing_role_code", "contact_id"], name: "index_publishing_role_publishable_contact", unique: true
  end

  create_table "purchase_line_items", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "quantity"
    t.decimal "purchase_value"
    t.string "allocatable_type", limit: 255
    t.integer "allocatable_id"
    t.text "explanation"
    t.integer "printer_estimate_id"
    t.decimal "tax_amount"
    t.decimal "tax_rate"
    t.integer "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["allocatable_id", "allocatable_type"], name: "index_purchase_line_items_alloc"
    t.index ["printer_estimate_id"], name: "index_purchase_line_items_on_printer_estimate_id"
    t.index ["purchase_id"], name: "index_purchase_line_items_on_purchase_id"
  end

  create_table "purchases", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "invoice_type", limit: 255
    t.date "invoice_date"
    t.integer "purchase_quantity"
    t.decimal "purchase_value"
    t.decimal "tax_rate"
    t.decimal "tax"
    t.string "description", limit: 255
    t.decimal "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "print_item_id"
    t.integer "printer_estimate_id"
    t.integer "print_bundle_component_id"
    t.integer "order_id"
    t.integer "contact_id"
    t.index ["book_id"], name: "index_purchases_on_book_id"
    t.index ["client_id"], name: "index_purchases_on_client_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "queryable_objects", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quick_deals", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "rightlist_id"
    t.integer "contact_id"
    t.integer "book_id"
    t.integer "quantity"
    t.decimal "unit_price"
    t.integer "currency_id"
    t.integer "format_id"
    t.integer "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quickprices", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.decimal "amount"
    t.integer "channel_id"
    t.integer "currency_id"
    t.date "availability_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
  end

  create_table "quickprints", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "quantity"
    t.decimal "unit_price"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "currency_id"
    t.integer "printer_id"
  end

  create_table "quickrights", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.string "language", limit: 255
    t.string "isbn", limit: 255
    t.string "co_edition_title", limit: 255
    t.string "co_edition_title_prefix", limit: 255
    t.decimal "price"
    t.integer "currency_id"
    t.integer "channel_id"
    t.date "publication_date"
    t.boolean "include_in_house_charges"
    t.integer "quantity"
    t.decimal "retail_price"
    t.string "retail_currency", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id"
    t.text "countries", array: true
  end

  create_table "quickstarts", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.string "names_before_key", limit: 255
    t.string "keynames", limit: 255
    t.string "title", limit: 255
    t.string "isbn", limit: 255
    t.string "price", limit: 255
    t.date "pub_date"
    t.string "contract_name", limit: 255
    t.string "contract_type", limit: 255
    t.string "territory", limit: 255
    t.string "free_copies", limit: 255
    t.string "copyright_year", limit: 255
    t.string "author_discount", limit: 255
    t.string "remainder_rate", limit: 255
    t.string "statement_frequency", limit: 255
    t.string "term", limit: 255
    t.string "royalty_basis", limit: 255
    t.date "pub_before_date"
    t.date "signed_date"
    t.date "ms_delivery_date"
    t.date "ms_proofs_date"
    t.integer "contracttemplate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_quickstarts_on_client_id"
    t.index ["contracttemplate_id"], name: "index_quickstarts_on_contracttemplate_id"
    t.index ["user_id"], name: "index_quickstarts_on_user_id"
  end

  create_table "rates", id: :serial, force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rateable_id"
    t.string "rateable_type", limit: 255
    t.float "stars", null: false
    t.string "dimension", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", id: :serial, force: :cascade do |t|
    t.integer "cacheable_id"
    t.string "cacheable_type", limit: 255
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "receipts", id: :serial, force: :cascade do |t|
    t.float "receipt_value"
    t.string "original_currency", limit: 255
    t.float "original_receipt_value"
    t.string "payer", limit: 255
    t.date "receipt_date"
    t.integer "contact_id"
    t.integer "right_id"
    t.string "receipt_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "foreignright_id"
    t.string "currency", limit: 255
    t.string "receipt_ref", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.integer "rightsadvance_id"
    t.date "make_payment_to_contrib_date"
    t.string "receipt_category", limit: 255
    t.index ["client_id"], name: "index_receipts_on_client_id"
    t.index ["contact_id"], name: "index_receipts_on_contributor_id"
    t.index ["foreignright_id"], name: "index_receipts_on_foreignright_id"
    t.index ["right_id"], name: "index_receipts_on_right_id"
    t.index ["rightsadvance_id"], name: "index_receipts_on_rightsadvance_id"
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "region_codes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatedproducts", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "work_relation_code", limit: 255
    t.string "work_identifier", limit: 255
    t.string "work_id_type", limit: 255
    t.string "relatedmaterial_relatedwork_idvalue", limit: 255
    t.string "relation_code", limit: 255
    t.string "product_identifier", limit: 255
    t.string "product_id_type", limit: 255
    t.string "id_value", limit: 255
    t.string "format", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "share"
    t.integer "priority_rating"
    t.index ["book_id"], name: "index_relatedproducts_on_book_id"
    t.index ["client_id"], name: "index_relatedproducts_on_client_id"
    t.index ["user_id"], name: "index_relatedproducts_on_user_id"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "relation_id"
    t.integer "client_id"
    t.integer "user_id"
    t.string "relation_type", limit: 255
    t.date "valid_from"
    t.date "valid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["contact_id"], name: "index_relationships_on_contact_id"
    t.index ["relation_id"], name: "index_relationships_on_relation_id"
  end

  create_table "reports", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "csv_file_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_reports_on_client_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "reprints", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.text "description"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_reprints_on_work_id"
  end

  create_table "request_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.text "request"
    t.text "ip_address"
    t.datetime "created_at"
  end

  create_table "return_reserve_rates", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "return_reservable_id"
    t.string "return_reservable_type", limit: 255
    t.integer "book_statement_number", null: false
    t.decimal "reserve_rate_pct", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["return_reservable_id", "return_reservable_type", "book_statement_number"], name: "index_return_reserve_rates_reservable", unique: true
  end

  create_table "returns", id: :serial, force: :cascade do |t|
    t.date "invoice_date"
    t.integer "book_id"
    t.integer "return_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["book_id"], name: "index_returns_on_book_id"
    t.index ["user_id"], name: "index_returns_on_user_id"
  end

  create_table "returns_codes", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "supplier_ids", default: [], null: false, array: true
    t.integer "recipient_ids", default: [], null: false, array: true
    t.string "returns_code_type", null: false
    t.string "returns_code_type_name"
    t.string "returns_code", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_returns_codes_on_client_id"
  end

  create_table "returns_monthly_profile_months", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "returns_monthly_profile_id", null: false
    t.integer "month_no", null: false
    t.decimal "return_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["returns_monthly_profile_id", "month_no"], name: "returns_monthly_profile_months_profle_month"
  end

  create_table "returns_monthly_profiles", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.string "name", limit: 255, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "books_count", default: 0
    t.integer "channels_count", default: 0
    t.integer "book_channels_count", default: 0
    t.integer "imprints_count", default: 0
    t.integer "companies_count", default: 0
    t.integer "publishers_count", default: 0
    t.integer "estimates_count", default: 0
    t.index ["client_id", "name"], name: "index_returns_monthly_profiles_on_client_id_and_name"
  end

  create_table "returnvols", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "book_id"
    t.integer "return_quantity"
    t.date "invoice_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["book_id"], name: "index_returnvols_on_book_id"
    t.index ["client_id"], name: "index_returnvols_on_client_id"
    t.index ["user_id"], name: "index_returnvols_on_user_id"
  end

  create_table "right_countries", id: :serial, force: :cascade do |t|
    t.integer "country_code_id"
    t.integer "rightlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_code_id"], name: "index_right_countries_on_country_code_id"
    t.index ["rightlist_id"], name: "index_right_countries_on_rightlist_id"
  end

  create_table "rightlists", id: :serial, force: :cascade do |t|
    t.text "code"
    t.text "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "area", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.text "paste_country_codes"
    t.text "paste_region_codes"
    t.integer "rightslist_bundle_id"
    t.index ["client_id"], name: "index_rightlists_on_client_id"
    t.index ["user_id"], name: "index_rightlists_on_user_id"
  end

  create_table "rightregions", id: :serial, force: :cascade do |t|
    t.integer "region_code_id"
    t.integer "rightlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["region_code_id"], name: "index_rightregions_on_region_code_id"
    t.index ["rightlist_id"], name: "index_rightregions_on_rightlist_id"
  end

  create_table "rightrules", id: :serial, force: :cascade do |t|
    t.integer "contract_id"
    t.integer "first_lower"
    t.integer "first_upper"
    t.integer "second_lower"
    t.integer "second_upper"
    t.integer "third_lower"
    t.integer "third_upper"
    t.integer "fourth_lower"
    t.integer "fourth_upper"
    t.integer "fifth_lower"
    t.integer "fifth_upper"
    t.float "first_rate"
    t.float "second_rate"
    t.float "third_rate"
    t.float "fourth_rate"
    t.float "fifth_rate"
    t.integer "client_id"
    t.integer "work_id"
    t.string "rule_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "basis", limit: 255
    t.float "author_cut"
    t.integer "user_id"
    t.integer "foreignright_id"
    t.index ["client_id"], name: "index_rightrules_on_client_id"
    t.index ["contract_id"], name: "index_rightrules_on_contract_id"
    t.index ["user_id"], name: "index_rightrules_on_user_id"
    t.index ["work_id"], name: "index_rightrules_on_work_id"
  end

  create_table "rights", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.string "sales_rights_type", limit: 255
    t.string "countries_included", limit: 255
    t.string "countries_excluded", limit: 255
    t.string "regions_included", limit: 255
    t.string "regions_excluded", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "user_id"
    t.string "uuid"
    t.index ["book_id"], name: "index_rights_on_book_id"
    t.index ["client_id"], name: "index_rights_on_client_id"
    t.index ["user_id"], name: "index_rights_on_user_id"
  end

  create_table "rightsadvances", id: :serial, force: :cascade do |t|
    t.integer "work_id"
    t.float "advance_value"
    t.date "date"
    t.string "trigger", limit: 255
    t.string "original_currency", limit: 255
    t.float "original_advance_value"
    t.float "tax_rate"
    t.float "tax_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "foreignright_id"
    t.integer "user_id"
    t.integer "client_id"
    t.date "paid_date"
    t.index ["client_id"], name: "index_rightsadvances_on_client_id"
    t.index ["foreignright_id"], name: "index_rightsadvances_on_foreignright_id"
    t.index ["user_id"], name: "index_rightsadvances_on_user_id"
    t.index ["work_id"], name: "index_rightsadvances_on_work_id"
  end

  create_table "rightsguide_archives", id: :serial, force: :cascade do |t|
    t.string "pdf_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_rightsguide_archives_on_client_id"
  end

  create_table "rightslist_bundle_items", id: :serial, force: :cascade do |t|
    t.integer "rightslist_bundle_id"
    t.string "sales_rights_type", limit: 255
    t.string "place_and_inclusion", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rightlist_id"
    t.index ["rightlist_id"], name: "index_rightslist_bundle_items_on_rightlist_id"
    t.index ["rightslist_bundle_id"], name: "index_rightslist_bundle_items_on_rightslist_bundle_id"
  end

  create_table "rightslist_bundles", id: :serial, force: :cascade do |t|
    t.text "name"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_rightslist_bundles_on_client_id"
  end

  create_table "role_adopters", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "task_role_id"
    t.string "role_adoptability_type", limit: 255
    t.integer "role_adoptability_id"
    t.datetime "created_at"
    t.index ["role_adoptability_type", "role_adoptability_id", "task_role_id"], name: "index_role_adopters_adoptability_role", unique: true
    t.index ["task_role_id", "client_id", "role_adoptability_type", "role_adoptability_id"], name: "index_role_adopters_role_client_adoptability", unique: true
  end

  create_table "role_fulfillments", id: :serial, force: :cascade do |t|
    t.integer "role_adopter_id"
    t.integer "role_involvement_id"
    t.datetime "created_at"
    t.index ["role_adopter_id", "role_involvement_id"], name: "index_role_fulfillments_adoper_involvement", unique: true
    t.index ["role_involvement_id", "role_adopter_id"], name: "index_role_fulfillments_involvement_adoper", unique: true
  end

  create_table "role_involvements", id: :serial, force: :cascade do |t|
    t.integer "task_role_id"
    t.integer "client_id"
    t.string "role_involveability_type", limit: 255
    t.integer "role_involveability_id"
    t.datetime "created_at"
    t.index ["role_involveability_type", "role_involveability_id", "task_role_id"], name: "index_role_adopters_involveability_role", unique: true
    t.index ["task_role_id", "client_id", "role_involveability_type", "role_involveability_id"], name: "index_role_involvements_role_client_involveability"
  end

  create_table "role_set_fulfillments", id: :serial, force: :cascade do |t|
    t.integer "role_adopter_id"
    t.integer "role_set_role_id"
    t.datetime "created_at"
    t.index ["role_adopter_id", "role_set_role_id"], name: "index_role_set_fulfillements_adopter_set", unique: true
    t.index ["role_set_role_id", "role_adopter_id"], name: "index_role_set_fulfillements_set_adopter", unique: true
  end

  create_table "role_set_roles", id: :serial, force: :cascade do |t|
    t.integer "role_set_id"
    t.integer "task_role_id"
    t.datetime "created_at"
    t.index ["role_set_id", "task_role_id"], name: "index_role_set_roles_on_role_set_id_and_task_role_id", unique: true
    t.index ["task_role_id", "role_set_id"], name: "index_role_set_roles_on_task_role_id_and_role_set_id", unique: true
  end

  create_table "role_sets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.text "description"
    t.hstore "restrict_to_use_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "default_for_client_count", default: 0
    t.integer "default_for_imprints_count", default: 0
    t.integer "default_for_seriesnames_count", default: 0
    t.integer "default_for_proprietary_edition_descriptions_count", default: 0
    t.integer "role_set_roles_count", default: 0
    t.index ["client_id", "description"], name: "index_role_sets_on_client_id_and_description"
  end

  create_table "royalty_algorithm_versions", id: :serial, force: :cascade do |t|
    t.integer "royalty_algorithm_id", null: false
    t.integer "version_number", null: false
    t.date "release_date", null: false
    t.text "change_log", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "royalty_algorithms", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "comments", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "royalty_batch_book_channels", id: :serial, force: :cascade do |t|
    t.integer "royalty_batch_book_id", null: false
    t.integer "book_channel_id", null: false
    t.string "channel_name", limit: 255, null: false
    t.integer "book_royalty_specifier_id"
    t.integer "book_masterchannel_royalty_specifier_id"
    t.integer "book_channel_royalty_specifier_id"
    t.integer "channel_royalty_specifier_id"
    t.decimal "royalty_rate_base_pct"
    t.decimal "royalty_rate_lower_limit"
    t.decimal "royalty_rate_upper_limit"
    t.string "price_basis", limit: 255
    t.string "quantity_modifier_type", limit: 255
    t.string "date_modifier_type", limit: 255
    t.string "royalty_rate_base_pct_source_class", limit: 255
    t.string "royalty_rate_lower_limit_source_class", limit: 255
    t.string "royalty_rate_upper_limit_source_class", limit: 255
    t.string "price_basis_source_class", limit: 255
    t.string "quantity_modifier_type_source_class", limit: 255
    t.string "date_modifier_type_source_class", limit: 255
    t.integer "price_escalator_specifier_id"
    t.integer "quantity_escalator_specifier_id"
    t.integer "date_escalator_specifier_id"
    t.string "quantity_escalator_aggregation_class", limit: 255
    t.integer "quantity_escalator_aggregation_id"
    t.integer "last_channel_price_id"
    t.integer "last_book_price_id"
    t.index ["royalty_batch_book_id", "book_channel_id"], name: "index_royalty_batch_book_channels_unq", unique: true
  end

  create_table "royalty_batch_books", id: :serial, force: :cascade do |t|
    t.integer "royalty_batch_id", null: false
    t.integer "book_id", null: false
    t.boolean "has_book_royalty_specifier"
    t.boolean "has_book_royalty_rate_base_pct"
    t.boolean "has_book_royalty_rate_upper_limit_pct"
    t.boolean "has_book_royalty_rate_lower_limit_pct"
    t.boolean "has_book_price_escalator"
    t.boolean "has_book_quantity_escalator"
    t.boolean "has_book_date_specifier"
    t.boolean "has_book_masterchannel_royalty_specifier"
    t.boolean "has_book_masterchannel_royalty_rate_base_pct"
    t.boolean "has_book_masterchannel_royalty_rate_upper_limit_pct"
    t.boolean "has_book_masterchannel_royalty_rate_lower_limit_pct"
    t.boolean "has_book_masterchannel_price_escalator"
    t.boolean "has_book_masterchannel_quantity_escalator"
    t.boolean "has_book_masterchannel_date_specifier"
    t.boolean "new_calculation_version_created"
    t.decimal "total_change_in_payable_amount"
    t.integer "new_sale_royalty_records"
    t.decimal "total_absolute_change_in_payable_amount"
    t.string "status", limit: 255, default: "Review"
    t.integer "sale_records"
    t.integer "unroyaltied_sales"
    t.boolean "contract_is_active"
    t.boolean "base_rates_all_present"
    t.integer "royalty_algorithm_version_id"
    t.date "max_actual_invoice_date"
    t.boolean "has_default_price"
    t.index ["royalty_batch_id", "book_id"], name: "index_royalty_batch_books_on_royalty_batch_id_and_book_id", unique: true
    t.index ["royalty_batch_id"], name: "index_royalty_batch_books_on_royalty_batch_id"
  end

  create_table "royalty_batches", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.string "status", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "new_calculation_version_created"
    t.decimal "total_change_in_payable_amount"
    t.integer "new_sale_royalty_records"
    t.decimal "total_absolute_change_in_payable_amount"
    t.string "batch_name", limit: 255, null: false
    t.text "comments"
    t.date "max_invoice_date"
    t.integer "editions"
    t.date "max_actual_invoice_date"
    t.index ["client_id", "user_id"], name: "index_royalty_batches_on_client_id_and_user_id"
  end

  create_table "royalty_date_escalators", id: :serial, force: :cascade do |t|
    t.integer "royalty_specifier_id", null: false
    t.date "escalation_date", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.index ["royalty_specifier_id", "escalation_date"], name: "index_royalty_date_escalators_unique", unique: true
  end

  create_table "royalty_discount_escalators", id: :serial, force: :cascade do |t|
    t.integer "royalty_specifier_id", null: false
    t.decimal "escalation_discount", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.index ["royalty_specifier_id", "escalation_discount"], name: "index_royalty_discount_escalators_unique", unique: true
  end

  create_table "royalty_import_rows", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "work_id"
    t.integer "book_id"
    t.integer "contact_id"
    t.decimal "rate"
  end

  create_table "royalty_liabilities", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "royarchive_id"
    t.integer "contact_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_royalty_liabilities_on_client_id"
    t.index ["contact_id"], name: "index_royalty_liabilities_on_contact_id"
    t.index ["royarchive_id"], name: "index_royalty_liabilities_on_royarchive_id"
  end

  create_table "royalty_quantity_escalator_channel_rates", id: :serial, force: :cascade do |t|
    t.integer "royalty_quantity_escalator_id", null: false
    t.integer "channel_id", null: false
    t.decimal "royalty_percentage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.index ["royalty_quantity_escalator_id", "channel_id"], name: "index_royalty_quantity_escalator_channel_rates_unique", unique: true
  end

  create_table "royalty_quantity_escalators", id: :serial, force: :cascade do |t|
    t.integer "royalty_specifier_id", null: false
    t.integer "quantity_step", null: false
    t.decimal "royalty_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.datetime "child_changed_at"
    t.index ["royalty_specifier_id", "quantity_step"], name: "index_royalty_quantity_escalators_unique", unique: true
  end

  create_table "royalty_specifiers", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.boolean "template", null: false
    t.integer "client_id", null: false
    t.integer "royaltyable_id"
    t.string "royaltyable_type", limit: 255
    t.decimal "royalty_rate_base_pct"
    t.decimal "royalty_rate_upper_limit_pct"
    t.decimal "royalty_rate_lower_limit_pct"
    t.string "price_basis", limit: 255, null: false
    t.string "quantity_modifier_type", limit: 255, null: false
    t.string "date_modifier_type", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "calc_on_sale_import", default: false, null: false
    t.string "checksum", limit: 255
    t.datetime "child_changed_at"
    t.index ["client_id", "template"], name: "index_royalty_specifiers_on_client_id_and_template"
    t.index ["royaltyable_id", "royaltyable_type"], name: "index_royalty_specifiers_on_royaltyable_id_and_royaltyable_type", unique: true
  end

  create_table "royalty_template_channels", id: :serial, force: :cascade do |t|
    t.integer "royalty_template_id", null: false
    t.integer "channel_id", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id"], name: "index_royalty_template_channels_on_channel_id"
    t.index ["client_id"], name: "index_royalty_template_channels_on_client_id"
    t.index ["royalty_template_id"], name: "index_royalty_template_channels_on_royalty_template_id"
  end

  create_table "royalty_template_masterchannels", id: :serial, force: :cascade do |t|
    t.integer "royalty_template_id", null: false
    t.integer "masterchannel_id", null: false
    t.integer "client_id", null: false
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_royalty_template_masterchannels_on_client_id"
    t.index ["masterchannel_id"], name: "index_royalty_template_masterchannels_on_masterchannel_id"
    t.index ["royalty_template_id"], name: "index_royalty_template_masterchannels_on_royalty_template_id"
  end

  create_table "royalty_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name"
    t.integer "royalty_templateable_id"
    t.string "royalty_templateable_type"
    t.text "description"
    t.index ["client_id"], name: "index_royalty_templates_on_client_id"
    t.index ["royalty_templateable_id", "royalty_templateable_type"], name: "index_royalty_templates_templateable"
  end

  create_table "royarchives", id: :serial, force: :cascade do |t|
    t.string "pdf_file_name", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "sent"
    t.text "message"
    t.integer "contact_id"
    t.integer "period_id"
    t.integer "work_id"
    t.index ["client_id"], name: "index_royarchives_on_client_id"
    t.index ["contact_id"], name: "index_royarchives_on_contact_id"
    t.index ["period_id"], name: "index_royarchives_on_period_id"
    t.index ["user_id"], name: "index_royarchives_on_user_id"
  end

  create_table "roystatements", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contact_id"
    t.decimal "royalty_earned"
    t.integer "period_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "sale_quantity"
    t.float "sale_value"
    t.float "advance_agreed"
    t.float "payments_made"
    t.float "reserve_value"
    t.float "royalty_due"
    t.date "statement_date"
    t.float "guaranteed_royalty_value"
    t.float "flat_fee_value"
    t.integer "contractset_id"
    t.index ["client_id"], name: "index_roystatements_on_client_id"
    t.index ["contact_id"], name: "index_roystatements_on_contributor_id"
    t.index ["contractset_id"], name: "index_roystatements_on_contractset_id"
    t.index ["period_id"], name: "index_roystatements_on_period_id"
    t.index ["user_id"], name: "index_roystatements_on_user_id"
  end

  create_table "rules", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "channel_id"
    t.integer "first_lower", default: 0
    t.integer "first_upper"
    t.integer "second_lower"
    t.integer "second_upper", default: 100000
    t.integer "third_lower"
    t.integer "third_upper", default: 100000
    t.integer "fourth_lower"
    t.integer "fourth_upper", default: 100000
    t.integer "fifth_lower"
    t.integer "fifth_upper", default: 100000
    t.float "first_rate"
    t.float "second_rate"
    t.float "third_rate"
    t.float "fourth_rate"
    t.float "fifth_rate"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "masterrule_id"
    t.decimal "reserve"
    t.index ["channel_id"], name: "index_rules_on_channel_id"
    t.index ["client_id"], name: "index_rules_on_client_id"
    t.index ["masterrule_id"], name: "index_rules_on_masterrule_id"
    t.index ["user_id"], name: "index_rules_on_user_id"
  end

  create_table "sale_cashflow_monthly_profile_months", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.integer "sale_cashflow_monthly_profile_id", null: false
    t.integer "month_no", null: false
    t.decimal "cashflow_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_cashflow_monthly_profile_id", "month_no"], name: "index_sale_cashflow_monthly_profile_months_id_month"
  end

  create_table "sale_cashflow_monthly_profiles", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.string "name", limit: 255, null: false
    t.integer "companies_count", default: 0, null: false
    t.integer "publishers_count", default: 0, null: false
    t.integer "imprints_count", default: 0, null: false
    t.integer "channels_count", default: 0, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "name"], name: "index_sale_cashflow_monthly_profiles_on_client_id_and_name"
  end

  create_table "sale_profileable_sales_profiles", id: :serial, force: :cascade do |t|
    t.integer "sales_profileable_id", null: false
    t.string "sales_profileable_type", limit: 255, null: false
    t.integer "sales_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_profile_id"], name: "index_sale_profileable_sales_profiles_on_sales_profile_id"
    t.index ["sales_profileable_id", "sales_profileable_type"], name: "sale_profileable_sales_profiles_profileable", unique: true
  end

  create_table "sale_royalties", id: :serial, force: :cascade do |t|
    t.integer "sale_id", null: false
    t.integer "calculation_version", null: false
    t.integer "client_id", null: false
    t.integer "royalty_batch_id", null: false
    t.integer "book_id", null: false
    t.integer "masterchannel_id"
    t.integer "channel_id"
    t.date "invoice_date"
    t.decimal "sale_value"
    t.integer "sale_quantity"
    t.string "sale_fraction"
    t.decimal "price_amount"
    t.decimal "royalty_rate_base_pct"
    t.decimal "royalty_rate_lower_limit"
    t.decimal "royalty_rate_upper_limit"
    t.string "quantity_modifier_type", limit: 255
    t.string "quantity_escalator_lower_limit"
    t.string "quantity_escalator_royalty_percentage"
    t.string "price_basis", limit: 255
    t.decimal "discount_escalator_escalation_discount"
    t.decimal "discount_escalator_royalty_percentage"
    t.decimal "discount_escalator_royalty_rate_factor"
    t.string "date_modifier_type", limit: 255
    t.date "date_escalator_escalation_date"
    t.decimal "date_escalator_royalty_percentage"
    t.decimal "date_escalator_royalty_rate_factor"
    t.decimal "royaltyable_amount"
    t.decimal "royalty_payable_amount"
    t.boolean "changed_book_id"
    t.boolean "changed_masterchannel_id"
    t.boolean "changed_channel_id"
    t.boolean "changed_invoice_date"
    t.boolean "changed_sale_value"
    t.boolean "changed_sale_quantity"
    t.boolean "changed_sale_fraction"
    t.boolean "changed_price_amount"
    t.boolean "changed_royalty_rate_base_pct"
    t.boolean "changed_royalty_rate_lower_limit"
    t.boolean "changed_royalty_rate_upper_limit"
    t.boolean "changed_quantity_modifier_type"
    t.boolean "changed_quantity_escalator_lower_limit"
    t.boolean "changed_quantity_escalator_royalty_percentage"
    t.boolean "changed_price_basis"
    t.boolean "changed_discount_escalator_escalation_discount"
    t.boolean "changed_discount_escalator_royalty_percentage"
    t.boolean "changed_discount_escalator_royalty_rate_factor"
    t.boolean "changed_date_modifier_type"
    t.boolean "changed_date_escalator_escalation_date"
    t.boolean "changed_date_escalator_royalty_percentage"
    t.boolean "changed_date_escalator_royalty_rate_factor"
    t.boolean "changed_royaltyable_amount"
    t.boolean "changed_royalty_payable_amount"
    t.decimal "change_in_payable_amount"
    t.integer "royalty_batch_book_id"
    t.boolean "sale_use_for_royalties", null: false
    t.index ["book_id"], name: "index_sale_royalties_on_book_id"
    t.index ["royalty_batch_book_id"], name: "index_sale_royalties_on_royalty_batch_book_id"
    t.index ["royalty_batch_id"], name: "index_sale_royalties_on_batch_id"
    t.index ["sale_id", "calculation_version"], name: "index_sale_royalties_on_sale_id_and_version_number", unique: true
  end

  create_table "saleimportrecords", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "expectedsale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "period_id"
    t.index ["client_id"], name: "index_saleimportrecords_on_client_id"
    t.index ["expectedsale_id"], name: "index_saleimportrecords_on_expectedsale_id"
    t.index ["period_id"], name: "index_saleimportrecords_on_period_id"
  end

  create_table "sales", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "sale_quantity"
    t.float "sale_value"
    t.string "currency", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "customer", limit: 255
    t.decimal "retail_price"
    t.decimal "discount"
    t.integer "channel_id"
    t.date "invoice_date"
    t.integer "client_id"
    t.integer "user_id"
    t.boolean "exclude"
    t.string "masterchannel_id", limit: 255
    t.string "invoice_number", limit: 255
    t.string "sales_type", limit: 255
    t.string "wrong_channel_alert", limit: 255
    t.integer "expectedsale_id"
    t.integer "currency_id"
    t.float "original_value"
    t.integer "original_currency_id"
    t.boolean "use_for_royalties", default: true
    t.integer "book_channel_id"
    t.integer "sale_sourceable_id"
    t.string "sale_sourceable_type", limit: 255
    t.date "sale_date"
    t.date "customer_delivery_date"
    t.decimal "customer_delivery_cost"
    t.index ["book_id"], name: "index_sales_on_book_id"
    t.index ["channel_id"], name: "index_sales_on_channel_id"
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["currency_id"], name: "index_sales_on_currency_id"
    t.index ["expectedsale_id"], name: "index_sales_on_expectedsale_id"
    t.index ["masterchannel_id"], name: "index_sales_on_masterchannel_id"
    t.index ["original_currency_id"], name: "index_sales_on_original_currency_id"
    t.index ["sale_sourceable_id", "sale_sourceable_type"], name: "index_sales_sale_sourceable"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "sales_profile_months", id: :serial, force: :cascade do |t|
    t.integer "sales_profile_id", null: false
    t.integer "month_number", null: false
    t.decimal "sales_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_profile_id", "month_number"], name: "index_sales_profile_months_on_sales_profile_id_and_month_number"
  end

  create_table "sales_profiles", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "name", limit: 255, null: false
    t.string "code", limit: 255, null: false
    t.text "description"
    t.integer "sales_profile_months_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sales_profiles_on_client_id"
  end

  create_table "sales_restrictions", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "sales_restriction_type", limit: 255
    t.string "sales_outlet_name", limit: 255
    t.text "sales_restriction_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "book_id"
    t.index ["book_id"], name: "index_sales_restrictions_on_book_id"
    t.index ["client_id"], name: "index_sales_restrictions_on_client_id"
  end

  create_table "sales_rights", id: :serial, force: :cascade do |t|
    t.integer "contract_id", null: false
    t.string "sales_rights_type", limit: 255, null: false
    t.text "countries_included", array: true
    t.text "regions_included", array: true
    t.text "countries_excluded", array: true
    t.text "regions_excluded", array: true
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_sales_rights_on_client_id"
    t.index ["contract_id"], name: "index_sales_rights_on_contract_id"
    t.index ["sales_rights_type"], name: "index_sales_rights_on_sales_rights_type"
  end

  create_table "saved_searches", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.text "search_param"
    t.string "name", limit: 255
    t.boolean "make_public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "grouped_by_param"
    t.string "saved_searchable_type"
    t.integer "saved_searchable_id"
    t.index ["saved_searchable_id", "saved_searchable_type"], name: "index_saved_searches_search"
    t.index ["user_id"], name: "index_saved_searches_on_user_id"
  end

  create_table "scale_element_prices", id: :serial, force: :cascade do |t|
    t.integer "scale_element_id"
    t.string "name", limit: 255
    t.integer "price_units"
    t.decimal "price_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "finance_code_allocations_count", default: 0
    t.string "print_bundle_component_name", limit: 255
    t.index ["scale_element_id"], name: "index_scale_element_prices_on_scale_element_id"
  end

  create_table "scale_element_x_prices", id: :serial, force: :cascade do |t|
    t.integer "scale_element_id"
    t.string "name", limit: 255
    t.integer "x_units"
    t.integer "x_interpolation"
    t.integer "x_extrapolation_up"
    t.integer "x_extrapolation_down"
    t.decimal "x_values", array: true
    t.integer "price_units"
    t.decimal "price_values", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "finance_code_allocations_count", default: 0
    t.string "print_bundle_component_name", limit: 255
    t.index ["scale_element_id"], name: "index_scale_element_x_prices_on_scale_element_id"
  end

  create_table "scale_element_xy_prices", id: :serial, force: :cascade do |t|
    t.integer "scale_element_id"
    t.string "name", limit: 255
    t.integer "x_units"
    t.integer "x_interpolation"
    t.integer "x_extrapolation_up"
    t.integer "x_extrapolation_down"
    t.decimal "x_values", array: true
    t.integer "y_units"
    t.integer "y_interpolation"
    t.integer "y_extrapolation_up"
    t.integer "y_extrapolation_down"
    t.decimal "y_values", array: true
    t.integer "price_units"
    t.decimal "price_values", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "finance_code_allocations_count", default: 0
    t.string "print_bundle_component_name", limit: 255
    t.index ["scale_element_id"], name: "index_scale_element_xy_prices_on_scale_element_id"
  end

  create_table "scale_elements", id: :serial, force: :cascade do |t|
    t.integer "scale_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "description"
    t.integer "scale_element_prices_count", default: 0
    t.integer "scale_element_x_prices_count", default: 0
    t.integer "scale_element_xy_prices_count", default: 0
    t.integer "finance_code_allocations_count", default: 0
    t.string "print_bundle_component_name", limit: 255
    t.text "product_form_categories", array: true
    t.boolean "product_form_categories_exclude", default: false
    t.index ["scale_id"], name: "index_scale_elements_on_scale_id"
  end

  create_table "scales", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "supplier_contact_id"
    t.string "name", limit: 255
    t.text "description"
    t.string "currency_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "finance_code_allocations_count", default: 0
    t.string "print_bundle_component_name", limit: 255
    t.text "product_form_categories", array: true
    t.boolean "product_form_categories_exclude", default: false
    t.index ["client_id"], name: "index_scales_on_client_id"
    t.index ["supplier_contact_id"], name: "index_scales_on_supplier_contact_id"
  end

  create_table "schedule_users", id: :serial, force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "user_id"
    t.string "role_description", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_users_on_schedule_id"
    t.index ["user_id"], name: "index_schedule_users_on_user_id"
  end

  create_table "schedules", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 255
    t.string "schedule_type", limit: 255
    t.string "schedulable_type", limit: 255
    t.integer "schedulable_id"
    t.boolean "template"
    t.integer "from_template_id"
    t.index ["book_id"], name: "index_schedules_on_book_id"
    t.index ["client_id"], name: "index_schedules_on_client_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "scratchpads", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "current"
    t.string "name", limit: 255
  end

  create_table "seriesname_channels", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "seriesname_id", null: false
    t.integer "channel_id", null: false
    t.decimal "average_royalty_rate"
    t.decimal "default_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seriesname_id", "channel_id"], name: "index_seriesname_channels_on_seriesname_id_and_channel_id", unique: true
  end

  create_table "seriesname_default_prices", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id"
    t.integer "currency_id", null: false
    t.integer "seriesname_id", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seriesnames", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "title_prefix", limit: 255
    t.string "title_without_prefix", limit: 255
    t.string "subtitle", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "idvalue", limit: 255
    t.string "idtype", limit: 255
    t.string "collection_type", limit: 255
    t.integer "imprint_id"
    t.string "code", limit: 255
    t.decimal "default_shipment_lead_time"
    t.integer "default_printer_contact_id"
    t.integer "book_seriesnames_count", default: 0
    t.integer "default_role_set_id"
    t.text "short_description"
    t.text "long_description"
    t.string "print_issn", limit: 9
    t.string "legacy_identifier"
    t.string "online_issn", limit: 9
    t.string "in_house_name"
    t.text "logo_file_name"
    t.integer "logo_file_size"
    t.string "logo_fingerprint"
    t.index ["client_id", "legacy_identifier"], name: "index_seriesnames_on_client_id_and_legacy_identifier"
    t.index ["client_id"], name: "index_seriesnames_on_client_id"
    t.index ["user_id"], name: "index_seriesnames_on_user_id"
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", limit: 255, null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "shipments", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "vessel_name", limit: 255
    t.string "territory", limit: 255
    t.integer "currency_id"
    t.integer "contact_id"
    t.integer "shipping_rate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "eta"
    t.date "etd"
    t.decimal "cost_per_kilo"
    t.integer "print_bundle_component_id"
    t.index ["client_id"], name: "index_shipments_on_client_id"
    t.index ["print_bundle_component_id"], name: "index_shipments_on_print_bundle_component_id"
  end

  create_table "shipping_rates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "currency_id"
    t.decimal "cost_amount"
    t.date "valid_from"
    t.date "valid_to"
    t.integer "rightlist_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ship_to_country", limit: 255
    t.index ["client_id"], name: "index_shipping_rates_on_client_id"
  end

  create_table "shop_collection_shop_products", id: :serial, force: :cascade do |t|
    t.integer "shop_collection_id"
    t.integer "shop_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "required_action_on_shopify", limit: 255
    t.index ["shop_collection_id"], name: "index_shop_collection_shop_products_on_shop_collection_id"
    t.index ["shop_product_id"], name: "index_shop_collection_shop_products_on_shop_product_id"
  end

  create_table "shop_collections", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "body_html"
    t.text "handle"
    t.text "image"
    t.string "published", limit: 255
    t.string "sort_order", limit: 255
    t.string "title", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "shop_id"
    t.text "local_signature"
    t.text "shopify_signature"
    t.text "shop_products"
    t.text "staging_shopify_signature"
    t.bigint "staging_shop_id"
    t.text "shop_products_to_delete", array: true
    t.integer "bibliocloud_shop_id"
    t.index ["bibliocloud_shop_id"], name: "index_shop_collections_on_bibliocloud_shop_id"
    t.index ["handle"], name: "index_shop_collections_on_handle"
    t.index ["shop_id"], name: "index_shop_collections_on_shop_id"
  end

  create_table "shop_customers", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "shop_customer_id", null: false
    t.json "data", default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "deleted", default: false, null: false
    t.index ["client_id"], name: "index_shop_customers_on_client_id"
    t.index ["shop_customer_id"], name: "index_shop_customers_on_shop_customer_id"
    t.index ["shop_id"], name: "index_shop_customers_on_shop_id"
  end

  create_table "shop_orders", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "shop_order_id", null: false
    t.json "data", default: {}, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "deleted", default: false, null: false
    t.index ["client_id"], name: "index_shop_orders_on_client_id"
    t.index ["shop_id"], name: "index_shop_orders_on_shop_id"
    t.index ["shop_order_id"], name: "index_shop_orders_on_shop_order_id"
  end

  create_table "shop_product_image_shop_product_variants", id: :serial, force: :cascade do |t|
    t.integer "shop_product_image_id"
    t.integer "shop_product_variant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["shop_product_image_id"], name: "index_shop_product_image_shop_product_variants_img"
    t.index ["shop_product_variant_id"], name: "index_shop_product_image_shop_product_variants_var"
  end

  create_table "shop_product_images", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.integer "product_id"
    t.text "src"
    t.integer "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "shop_product_id"
    t.index ["book_id"], name: "index_shop_product_images_on_book_id"
    t.index ["product_id"], name: "index_shop_product_images_on_product_id"
    t.index ["shop_product_id"], name: "index_shop_product_images_on_shop_product_id"
  end

  create_table "shop_product_variants", id: :serial, force: :cascade do |t|
    t.text "barcode"
    t.string "compare_at_price", limit: 255
    t.string "fulfillment_service", limit: 255
    t.decimal "grams"
    t.string "inventory_management", limit: 255
    t.string "inventory_policy", limit: 255
    t.string "inventory_quantity", limit: 255
    t.text "option1"
    t.text "option2"
    t.text "option3"
    t.integer "position"
    t.decimal "price"
    t.integer "product_id"
    t.text "requires_shipping"
    t.text "sku"
    t.text "taxable"
    t.text "title"
    t.text "vendor"
    t.text "metafield"
    t.integer "image_id"
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["product_id"], name: "index_shop_product_variants_on_product_id"
    t.index ["shop_id"], name: "index_shop_product_variants_on_shop_id"
  end

  create_table "shop_products", id: :serial, force: :cascade do |t|
    t.text "body_html"
    t.text "handle"
    t.text "images"
    t.text "options"
    t.text "product_type"
    t.date "published_at"
    t.text "published_scope"
    t.text "tags"
    t.text "template_suffix"
    t.text "title"
    t.integer "client_id"
    t.integer "user_id"
    t.bigint "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.text "metafields"
    t.text "variants"
    t.text "local_signature"
    t.text "shopify_signature"
    t.boolean "hidden"
    t.text "staging_shopify_signature"
    t.bigint "staging_shop_id"
    t.integer "bibliocloud_shop_id"
    t.index ["bibliocloud_shop_id"], name: "index_shop_products_on_bibliocloud_shop_id"
  end

  create_table "shopify_logs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.text "message"
    t.integer "shop_id"
    t.integer "obj_id"
    t.string "obj_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopify_updates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "name", null: false
    t.string "api_key"
    t.string "api_password"
    t.string "shopname"
    t.string "webhook_signature"
    t.string "currency_code", limit: 3
    t.boolean "is_shopify", default: true, null: false
    t.string "presentation_name"
    t.boolean "default", default: false
    t.string "url"
    t.index ["client_id", "name"], name: "index_shops_on_client_id_and_name"
  end

  create_table "shortened_urls", id: :serial, force: :cascade do |t|
    t.integer "owner_id"
    t.string "owner_type", limit: 20
    t.string "url", limit: 255, null: false
    t.string "unique_key", limit: 10, null: false
    t.integer "use_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_shortened_urls_on_owner_id_and_owner_type"
    t.index ["unique_key"], name: "index_shortened_urls_on_unique_key", unique: true
    t.index ["url"], name: "index_shortened_urls_on_url"
  end

  create_table "sign_offs", id: :serial, force: :cascade do |t|
    t.integer "signoffable_id"
    t.string "signoffable_type", limit: 255
    t.integer "user_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_print_prices", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "upper_quantity_threshold"
    t.decimal "unit_cost"
    t.integer "run_on_upper_limit"
    t.decimal "run_on_unit_price"
    t.decimal "fixed_cost"
    t.integer "currency_id"
    t.string "scale", limit: 255
    t.integer "contact_id"
    t.text "notes"
    t.date "valid_until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "print_id"
  end

  create_table "smart_searches", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name", limit: 255
    t.string "first_class_object_type", limit: 255
    t.integer "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_class_object_child_type", limit: 255
    t.text "pages_for_first_class_objects"
  end

  create_table "smartystreet_api_calls", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "country_code", limit: 2
    t.text "request_hash"
    t.json "api_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id", "country_code", "request_hash"], name: "index_smartystreet_api_calls_client_country_hash", unique: true
  end

  create_table "spend_authorisations", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "print_bundle_component_id"
    t.integer "money_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "confirmed_date"
    t.index ["print_bundle_component_id"], name: "index_spend_authorisations_on_print_bundle_component_id"
  end

  create_table "spend_budgets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "royalty_budget"
    t.decimal "distribution_budget"
    t.decimal "sales_commission_budget"
    t.decimal "contribution"
    t.decimal "sale_returns_budget"
    t.decimal "returns_cost"
    t.decimal "rights_income_budget"
    t.decimal "rights_income_budget_spend"
    t.index ["work_id"], name: "index_spend_budgets_on_work_id"
  end

  create_table "spread_periods", id: :serial, force: :cascade do |t|
    t.integer "spread_id"
    t.string "from_date_type", limit: 255
    t.integer "add_months"
    t.decimal "spread_fraction"
    t.index ["spread_id"], name: "index_spread_periods_on_spread_id"
  end

  create_table "spreadable_spreads", id: :serial, force: :cascade do |t|
    t.integer "spread_id", null: false
    t.integer "spreadable_id", null: false
    t.string "spreadable_type", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "context", limit: 255
    t.index ["spread_id"], name: "index_spreadable_spreads_on_spread_id"
    t.index ["spreadable_id", "spreadable_type"], name: "index_spreadable_spreads_on_spreadable_id_and_spreadable_type"
  end

  create_table "spreads", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "name", limit: 255, null: false
    t.string "code", limit: 255, null: false
    t.string "base_date", limit: 255, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_spreads_on_client_id"
  end

  create_table "stages", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.integer "pipeline_id"
    t.integer "sequence_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "dealable_target_status"
    t.integer "deals_array", default: [], null: false, array: true
    t.index ["pipeline_id", "sequence_number"], name: "index_stages_on_pipeline_id_and_sequence_number"
  end

  create_table "statement_advances", id: :serial, force: :cascade do |t|
    t.integer "advance_id", null: false
    t.integer "book_id"
    t.integer "contract_id"
    t.integer "contact_id"
    t.string "trigger", limit: 255
    t.date "paid_date"
    t.date "due_date"
    t.decimal "advance_value"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "statement_contract_id"
    t.integer "statement_book_id"
    t.index ["statement_batch_contact_id"], name: "index_statement_advances_on_statement_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_advances_on_statement_batch_id"
    t.index ["statement_book_id"], name: "index_statement_advances_on_statement_book_id"
    t.index ["statement_contract_id"], name: "index_statement_advances_on_statement_contract_id"
  end

  create_table "statement_alternative_payees", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "alternative_payee_id"
    t.decimal "pay_percentage"
    t.decimal "pay_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_contract_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.boolean "after_deminimus", default: true, null: false
    t.decimal "set_payment"
    t.index ["statement_batch_contact_id"], name: "index_statement_alternative_payees_batch_cont"
    t.index ["statement_batch_id"], name: "index_statement_alternative_payees_on_statement_batch_id"
    t.index ["statement_contract_id"], name: "index_statement_alternative_payees_on_statement_contract_id"
  end

  create_table "statement_batch_contacts", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "contact_id", null: false
    t.integer "statement_batch_id", null: false
    t.decimal "payable_amount"
    t.string "status", limit: 255, null: false
    t.integer "statement_count"
    t.integer "contract_count"
    t.integer "work_count"
    t.integer "book_count"
    t.integer "last_statement_batch_contact_id"
    t.boolean "is_literary_agency"
    t.boolean "one_statement_per_contract", default: false
    t.index ["contact_id"], name: "index_statement_batch_contacts_on_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_batch_contacts_on_statement_batch_id"
  end

  create_table "statement_batches", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.string "name", limit: 255, null: false
    t.string "status", limit: 255, null: false
    t.text "comments"
    t.date "date_to"
    t.decimal "payable_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_count"
    t.integer "statement_count"
    t.index ["client_id"], name: "index_statement_batches_on_client_id"
  end

  create_table "statement_bmc_channel_rates", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_bmc_qty_escalator_id", null: false
    t.integer "channel_id", null: false
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_quantity_escalator_channel_rate_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_bmc_channel_rates_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_bmc_channel_rates_on_statement_batch_id"
    t.index ["statement_bmc_qty_escalator_id"], name: "index_statement_bmc_channel_rates_on_bmc_qty_escalator_id"
  end

  create_table "statement_bmc_date_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_bmc_specifier_id", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_date_escalator_id", null: false
    t.date "escalation_date", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_bmc_date_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_bmc_date_escalators_on_statement_batch_id"
    t.index ["statement_bmc_specifier_id"], name: "index_statement_bmc_date_escalators_on_bmc_specifier_id"
  end

  create_table "statement_bmc_discount_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_bmc_specifier_id", null: false
    t.integer "escalation_discount", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_discount_escalator_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_bmc_discount_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_bmc_discount_escalators_on_statement_batch_id"
    t.index ["statement_bmc_specifier_id"], name: "index_statement_bmc_discount_escalators_on_bmc_specifier_id"
  end

  create_table "statement_bmc_qty_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_bmc_specifier_id", null: false
    t.integer "quantity_step", null: false
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_quantity_escalator_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_bmc_qty_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_bmc_qty_escalators_on_statement_batch_id"
    t.index ["statement_bmc_specifier_id"], name: "index_statement_bmc_qty_escalators_on_bmc_specifier_id"
  end

  create_table "statement_bmc_specifiers", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_masterchannel_id", null: false
    t.integer "royalty_specifier_id", null: false
    t.decimal "royalty_rate_base_pct"
    t.decimal "royalty_rate_upper_limit_pct"
    t.decimal "royalty_rate_lower_limit_pct"
    t.string "price_basis", limit: 255, null: false
    t.string "quantity_modifier_type", limit: 255, null: false
    t.string "date_modifier_type", limit: 255, null: false
    t.string "checksum", limit: 255
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_bmc_specifiers_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_bmc_specifiers_on_statement_batch_id"
    t.index ["statement_masterchannel_id"], name: "index_statement_bmc_specifiers_on_statement_masterchannel_id"
  end

  create_table "statement_book_date_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_book_specifier_id", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_date_escalator_id", null: false
    t.date "escalation_date", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_book_date_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_book_date_escalators_on_statement_batch_id"
    t.index ["statement_book_specifier_id"], name: "index_statement_book_date_escalators_on_book_specifier_id"
  end

  create_table "statement_book_discount_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_book_specifier_id", null: false
    t.integer "escalation_discount", null: false
    t.decimal "royalty_rate_factor"
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_discount_escalator_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_book_discount_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_book_discount_escalators_on_statement_batch_id"
    t.index ["statement_book_specifier_id"], name: "index_statement_book_discount_escalators_on_book_specifier_id"
  end

  create_table "statement_book_qty_escalators", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_book_specifier_id", null: false
    t.integer "quantity_step", null: false
    t.decimal "royalty_percentage"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "royalty_quantity_escalator_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_book_qty_escalators_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_book_qty_escalators_on_statement_batch_id"
    t.index ["statement_book_specifier_id"], name: "index_statement_book_qty_escalators_on_book_specifier_id"
  end

  create_table "statement_book_specifiers", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_book_id", null: false
    t.integer "royalty_specifier_id", null: false
    t.decimal "royalty_rate_base_pct"
    t.decimal "royalty_rate_upper_limit_pct"
    t.decimal "royalty_rate_lower_limit_pct"
    t.string "price_basis", limit: 255, null: false
    t.string "quantity_modifier_type", limit: 255, null: false
    t.string "date_modifier_type", limit: 255, null: false
    t.string "checksum", limit: 255
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_book_specifiers_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_book_specifiers_on_statement_batch_id"
    t.index ["statement_book_id"], name: "index_statement_book_specifiers_on_statement_book_id"
  end

  create_table "statement_books", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_work_id", null: false
    t.integer "book_id", null: false
    t.string "title", limit: 255, null: false
    t.string "isbn", limit: 255
    t.string "format", limit: 255
    t.string "pub_date", limit: 255
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.date "date_to", null: false
    t.integer "last_statement_book_id"
    t.date "eligible_for_statements_from"
    t.integer "contact_id", null: false
    t.integer "previous_book_contact_statements", null: false
    t.date "include_sales_up_to"
    t.index ["book_id"], name: "index_statement_books_on_book_id"
    t.index ["statement_batch_contact_id"], name: "index_statement_books_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_books_on_statement_batch_id"
    t.index ["statement_work_id"], name: "index_statement_books_on_statement_work_id"
  end

  create_table "statement_channels", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_masterchannel_id", null: false
    t.integer "channel_id", null: false
    t.string "channel_name", limit: 255, null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "book_channel_id", null: false
    t.decimal "reserve_rate_pct", default: "0.0", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_channels_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_channels_on_statement_batch_id"
    t.index ["statement_masterchannel_id"], name: "index_statement_channels_on_statement_masterchannel_id"
  end

  create_table "statement_contract_channels", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_contract_id", null: false
    t.integer "contract_channel_id", null: false
    t.integer "channel_id", null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "contract_id", null: false
    t.string "channel_name", limit: 255
    t.index ["statement_batch_contact_id"], name: "index_statement_contract_channels_on_statement_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_contract_channels_on_statement_batch_id"
    t.index ["statement_contract_id"], name: "index_statement_contract_channels_on_statement_contract_id"
  end

  create_table "statement_contracts", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_id", null: false
    t.integer "contract_id", null: false
    t.string "contract_name", limit: 255, null: false
    t.date "signed_date"
    t.string "contract_type", limit: 255
    t.date "last_statement_date"
    t.date "terminated_date"
    t.string "termination_reason", limit: 255
    t.string "territory", limit: 255
    t.date "renewal_date"
    t.integer "contractset_id"
    t.string "contractset_name", limit: 255
    t.integer "next_statement_date"
    t.decimal "payment_split"
    t.integer "work_count"
    t.integer "book_count"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "last_statement_contract_id"
    t.date "date_to", null: false
    t.integer "statement_sales_lag_months"
    t.integer "statement_min_book_sale_months"
    t.decimal "opening_balance_amt", default: "0.0", null: false
    t.date "statement_start_date"
    t.decimal "set_sale_qty"
    t.decimal "set_sale_amt"
    t.decimal "set_royalties_paid_amt"
    t.decimal "set_advances_due_amt"
    t.decimal "set_advances_paid_amt"
    t.decimal "set_unearned_advance_amt"
    t.decimal "set_net_royalty_amt"
    t.decimal "set_net_royalty_and_fees_amt"
    t.decimal "set_net_royalty_fee_open_bal_amt"
    t.decimal "set_net_royalties_fees_alt_payees_open_bal_amt"
    t.decimal "set_payment_less_all_alternative_payees_amt"
    t.decimal "set_fees_due_amt"
    t.decimal "set_opening_balance_amt"
    t.decimal "set_total_paid_amt"
    t.decimal "set_unpaid_advance_amt"
    t.index ["contract_id"], name: "index_statement_contracts_on_contract_id"
    t.index ["contractset_id"], name: "index_statement_contracts_on_contractset_id"
    t.index ["statement_batch_contact_id"], name: "index_statement_contracts_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_contracts_on_statement_batch_id"
    t.index ["statement_id"], name: "index_statement_contracts_on_statement_id"
  end

  create_table "statement_masterchannels", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_book_id", null: false
    t.integer "masterchannel_id", null: false
    t.string "masterchannel_name", limit: 255, null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "book_masterchannel_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_masterchannels_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_masterchannels_on_statement_batch_id"
    t.index ["statement_book_id"], name: "index_statement_masterchannels_on_statement_book_id"
  end

  create_table "statement_monthly_royalties", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_channel_id", null: false
    t.date "invoice_month", null: false
    t.integer "sale_quantity"
    t.decimal "sale_value"
    t.integer "quantity_escalator_lower_limit"
    t.decimal "discount_escalator_escalation_discount"
    t.date "date_escalator_escalation_date"
    t.decimal "royalty_payable_amount"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "statement_book_id", null: false
    t.decimal "last_royalty_payable_amount"
    t.integer "last_sale_quantity"
    t.decimal "last_sale_value"
    t.index ["statement_batch_contact_id"], name: "index_statement_monthly_royalties_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_monthly_royalties_on_statement_batch_id"
    t.index ["statement_channel_id"], name: "index_statement_monthly_royalties_on_statement_channel_id"
  end

  create_table "statement_monthly_sales", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_channel_id", null: false
    t.date "invoice_month", null: false
    t.integer "statement_book_id", null: false
    t.integer "sale_quantity"
    t.decimal "sale_value"
    t.string "currency", limit: 255
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "last_sale_quantity", null: false
    t.decimal "last_sale_value", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_monthly_sales_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_monthly_sales_on_statement_batch_id"
    t.index ["statement_channel_id"], name: "index_statement_monthly_sales_on_statement_channel_id"
  end

  create_table "statement_payments", id: :serial, force: :cascade do |t|
    t.integer "payment_id", null: false
    t.integer "book_id"
    t.integer "contract_id"
    t.integer "contact_id"
    t.integer "advance_id"
    t.string "payment_type", limit: 255
    t.date "date"
    t.decimal "payment_value", null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "statement_contract_id"
    t.integer "statement_book_id"
    t.index ["statement_batch_contact_id"], name: "index_statement_payments_on_statement_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_payments_on_statement_batch_id"
    t.index ["statement_book_id"], name: "index_statement_payments_on_statement_book_id"
    t.index ["statement_contract_id"], name: "index_statement_payments_on_statement_contract_id"
  end

  create_table "statement_publishing_fees", id: :serial, force: :cascade do |t|
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "statement_contract_id", null: false
    t.integer "publishing_fee_id", null: false
    t.integer "client_id", null: false
    t.boolean "offset_against_royalties", null: false
    t.string "fee_name"
    t.decimal "fee_amt", null: false
    t.date "due_date"
    t.decimal "paid_amt", null: false
    t.date "paid_date"
    t.index ["client_id"], name: "index_statement_publishing_fees_on_client_id"
    t.index ["statement_batch_contact_id"], name: "index_statement_publishing_fees_on_statement_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_publishing_fees_on_statement_batch_id"
    t.index ["statement_contract_id"], name: "index_statement_publishing_fees_on_statement_contract_id"
  end

  create_table "statement_return_reserve_rates", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_number", null: false
    t.decimal "reserve_rate_pct", null: false
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "statement_return_reservable_id"
    t.string "statement_return_reservable_type", limit: 255
    t.index ["statement_batch_id"], name: "index_statement_return_reserve_rates_on_statement_batch_id"
    t.index ["statement_return_reservable_id"], name: "statement_return_reserve_rates_1"
    t.index ["statement_return_reservable_type"], name: "statement_return_reserve_rates_2"
  end

  create_table "statement_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "template_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statement_works", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_contract_id", null: false
    t.integer "work_id", null: false
    t.string "title", limit: 255
    t.string "istc_reference", limit: 255
    t.integer "book_count"
    t.integer "statement_batch_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.index ["statement_batch_contact_id"], name: "index_statement_works_on_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statement_works_on_statement_batch_id"
    t.index ["statement_contract_id"], name: "index_statement_works_on_statement_contract_id"
    t.index ["work_id"], name: "index_statement_works_on_work_id"
  end

  create_table "statements", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "statement_batch_contact_id", null: false
    t.integer "contact_id", null: false
    t.string "contact_name", limit: 255, null: false
    t.integer "statement_number"
    t.string "status", limit: 255, null: false
    t.date "date_from"
    t.date "date_to", null: false
    t.integer "statement_template_id"
    t.decimal "payable_amount"
    t.datetime "created_at", null: false
    t.integer "contract_count"
    t.integer "work_count"
    t.integer "book_count"
    t.integer "statement_batch_id", null: false
    t.integer "contractset_id"
    t.string "contractset_name", limit: 255
    t.text "contract_id_array"
    t.decimal "set_final_statement_amt"
    t.index ["contact_id"], name: "index_statements_on_contact_id"
    t.index ["statement_batch_contact_id"], name: "index_statements_on_statement_batch_contact_id"
    t.index ["statement_batch_id"], name: "index_statements_on_statement_batch_id"
    t.index ["status"], name: "index_statements_on_status"
  end

  create_table "stock_availabilities", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "stock_reportable_id", null: false
    t.string "stock_reportable_type", null: false
    t.date "as_of_date", null: false
    t.integer "book_id"
    t.string "identifier"
    t.integer "in_stock_qty"
    t.string "stock_code"
    t.string "availability_code"
    t.string "product_availability"
    t.integer "user_id"
    t.datetime "created_at"
    t.integer "sourceable_id"
    t.string "sourceable_type"
    t.index ["book_id", "stock_reportable_id", "stock_reportable_type", "as_of_date", "in_stock_qty"], name: "index_stock_availabilities_recent", order: { as_of_date: :desc }
    t.index ["book_id", "stock_reportable_id", "stock_reportable_type", "as_of_date"], name: "index_stock_availabilities_prev_record"
    t.index ["stock_reportable_id", "stock_reportable_type"], name: "index_stock_availabilities_reportable"
  end

  create_table "subject_corporate_bodies", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_subject_corporate_bodies_on_client_id"
  end

  create_table "subject_places", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_subject_places_on_client_id"
  end

  create_table "subjectcode_contacts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "subjectcode_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjectcodes", id: :serial, force: :cascade do |t|
    t.string "code", limit: 255
    t.string "value", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "client_id"
    t.string "main_bic_code", limit: 255
    t.string "main_bisac_code", limit: 255
    t.integer "age_range_code_id"
    t.integer "parent_id"
    t.text "parent_ids", default: [], array: true
    t.integer "marketing_highlight_work_ids", default: [], array: true
    t.index ["client_id"], name: "index_subjectcodes_on_client_id"
    t.index ["user_id"], name: "index_subjectcodes_on_user_id"
  end

  create_table "subjects", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.string "subject_scheme_identifier", limit: 255
    t.string "subject_code", limit: 255
    t.text "subject_description"
    t.integer "client_id"
    t.integer "user_id"
    t.integer "work_id"
    t.string "subject_scheme_version"
    t.string "subject_heading_text"
    t.index ["book_id"], name: "index_subjects_on_book_id"
    t.index ["client_id"], name: "index_subjects_on_client_id"
    t.index ["user_id"], name: "index_subjects_on_user_id"
    t.index ["work_id"], name: "index_subjects_on_work_id"
  end

  create_table "superadmins", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_configs", id: :serial, force: :cascade do |t|
    t.integer "proprietary_edition_description_id"
    t.integer "supplier_id"
    t.date "pub_date_from"
    t.date "pub_date_to"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "supply_to_countries", array: true
    t.text "supply_to_territories", array: true
    t.string "supply_to_region", limit: 255
    t.text "supply_to_countries_excluded", array: true
    t.text "supply_restriction_detail"
    t.string "returns_code_type", limit: 255
    t.string "returns_code", limit: 255
    t.string "bisac_returns_code", limit: 255
    t.string "onix_returns_code", limit: 255
    t.integer "order_time", limit: 2
    t.integer "new_supplier_id", limit: 2
    t.integer "on_sale_lead_days"
    t.string "audience_restriction_flag", limit: 255
    t.text "audience_restriction_note"
    t.integer "pack_quantity"
    t.string "supplier_role", limit: 255
    t.boolean "active"
    t.text "epub_type_codes", default: [], null: false, array: true
    t.text "price_currency_codes", default: [], null: false, array: true
    t.text "price_type_codes", default: [], null: false, array: true
    t.text "price_type_qualifier_codes", default: [], null: false, array: true
    t.text "product_forms", default: [], null: false, array: true
    t.integer "client_id", null: false
    t.integer "publishername_ids", default: [], array: true
    t.string "on_sale_date_derivation_method"
    t.integer "imprint_ids", default: [], null: false, array: true
    t.index ["proprietary_edition_description_id", "supplier_id"], name: "index_proprietary_edition_description_supplies_supplier_ped", unique: true
    t.index ["supplier_id", "proprietary_edition_description_id"], name: "index_proprietary_edition_description_supplies_ped_supplier", unique: true
  end

  create_table "supplier_identifiables", id: :serial, force: :cascade do |t|
    t.string "supplier_identifer_type", limit: 255
    t.string "identifier_type_name", limit: 255
    t.string "identifier_value", limit: 255
    t.string "supplier_identifiable_type", limit: 255
    t.integer "supplier_identifiable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["supplier_identifiable_id", "supplier_identifiable_type"], name: "index_supplier_identifiables_ident"
  end

  create_table "supplier_print_on_demand_specs", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "print_on_demand_spec_id", null: false
    t.integer "supplier_id", null: false
    t.date "supplier_notified_date"
    t.date "supplier_confirmed_date"
    t.integer "order_days"
    t.string "currency_code", limit: 3
    t.decimal "cost_amount"
    t.index ["print_on_demand_spec_id", "supplier_id"], name: "index_print_on_demand_specs_spec_supplier", unique: true
    t.index ["supplier_id", "print_on_demand_spec_id"], name: "index_print_on_demand_specs_supplier_spec", unique: true
  end

  create_table "supplier_products", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "book_id", null: false
    t.integer "supplier_id", null: false
    t.string "title"
    t.string "reference"
    t.text "for_sale_countries", array: true
    t.text "not_for_sale_countries", array: true
    t.date "pub_date"
    t.string "product_form"
    t.string "product_availability"
    t.string "availability_code"
    t.integer "in_stock_qty"
    t.jsonb "measures"
    t.jsonb "prices"
    t.index ["book_id"], name: "index_supplier_products_on_book_id"
    t.index ["client_id"], name: "index_supplier_products_on_client_id"
    t.index ["supplier_id"], name: "index_supplier_products_on_supplier_id"
  end

  create_table "supplies", id: :serial, force: :cascade do |t|
    t.text "countries_included"
    t.text "regions_included"
    t.text "countries_excluded"
    t.text "regions_excluded"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.integer "client_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_supplies_on_book_id"
    t.index ["client_id"], name: "index_supplies_on_client_id"
    t.index ["user_id"], name: "index_supplies_on_user_id"
  end

  create_table "supply_detail_prices", id: :serial, force: :cascade do |t|
    t.integer "supply_detail_id"
    t.integer "price_id"
    t.index ["price_id", "supply_detail_id"], name: "index_supply_detail_prices_on_price_id_and_supply_detail_id"
    t.index ["supply_detail_id", "price_id"], name: "index_supply_detail_prices_on_supply_detail_id_and_price_id"
  end

  create_table "supply_lists", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.text "description"
    t.text "country"
    t.text "territory"
    t.text "not_country"
    t.string "default_currency_code", limit: 255
    t.boolean "auto_include"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id", "name"], name: "index_supply_lists_on_client_id_and_name"
  end

  create_table "supplydetails", id: :serial, force: :cascade do |t|
    t.string "supplier_role", limit: 255
    t.string "supplier_name", limit: 255
    t.string "product_availability", limit: 255
    t.string "supply_date_role", limit: 255
    t.string "unpriced_item_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "supply_id"
    t.date "date"
    t.integer "client_id"
    t.integer "user_id"
    t.string "availability_code", limit: 255
    t.integer "contact_id"
    t.integer "book_id"
    t.text "supply_to_countries", array: true
    t.text "supply_to_territories", array: true
    t.string "supply_to_region", limit: 255
    t.text "supply_to_countries_excluded", array: true
    t.text "supply_restriction_detail"
    t.string "returns_code_type", limit: 255
    t.string "returns_code", limit: 255
    t.string "bisac_returns_code", limit: 255
    t.string "onix_returns_code", limit: 255
    t.date "last_date_for_returns"
    t.integer "order_time", limit: 2
    t.integer "new_supplier_id"
    t.date "expected_ship_date"
    t.integer "on_sale_lead_days"
    t.date "on_sale_date"
    t.string "audience_restriction_flag", limit: 255
    t.text "audience_restriction_note"
    t.integer "pack_quantity"
    t.index ["book_id"], name: "index_supplydetails_on_book_id"
    t.index ["client_id"], name: "index_supplydetails_on_client_id"
    t.index ["supply_id"], name: "index_supplydetails_on_supply_id"
    t.index ["user_id"], name: "index_supplydetails_on_user_id"
  end

  create_table "support_tickets", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "page_url"
    t.string "support_query_type", limit: 255
    t.string "subject", limit: 255
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "priority", limit: 255
  end

  create_table "supportingresources", id: :serial, force: :cascade do |t|
    t.string "resource_content_type", limit: 255
    t.string "content_audience", limit: 255
    t.string "resource_mode", limit: 255
    t.string "resource_form", limit: 255
    t.string "resource_link", limit: 255
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.string "image_remote_url", limit: 255
    t.integer "client_id"
    t.integer "user_id"
    t.text "image_meta"
    t.integer "work_id"
    t.string "resourceable_type", limit: 255
    t.integer "resourceable_id"
    t.integer "marketingtext_id"
    t.string "copyright_owner", limit: 255
    t.string "software_used", limit: 255
    t.string "copyright", limit: 255
    t.boolean "system_cover"
    t.string "image_fingerprint"
    t.index ["book_id"], name: "index_supportingresources_on_book_id"
    t.index ["client_id"], name: "index_supportingresources_on_client_id"
    t.index ["resourceable_id", "resourceable_type", "id"], name: "index_supportingresources_id_type_id"
    t.index ["work_id"], name: "index_supportingresources_on_work_id"
  end

  create_table "supports", id: :serial, force: :cascade do |t|
    t.string "heading", limit: 255
    t.string "text", limit: 255
    t.string "section", limit: 255
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_supports_on_user_id"
  end

  create_table "system_codes", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.string "modelname", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "system_feature_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "system_feature_id"
    t.date "confirmed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
  end

  create_table "system_features", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.boolean "mandatory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_message_users", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "system_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_messages", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.text "message_body"
    t.date "expiry_date"
    t.text "message_heading"
    t.text "link_to_follow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.integer "taggable_id"
    t.string "taggable_type", limit: 255
    t.integer "tagger_id"
    t.string "tagger_type", limit: 255
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "context", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id_and_context"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "task_contacts", id: :serial, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id", "task_id"], name: "index_task_contacts_on_contact_id_and_task_id", unique: true
    t.index ["task_id", "contact_id"], name: "index_task_contacts_on_task_id_and_contact_id", unique: true
  end

  create_table "task_roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["client_id"], name: "index_task_roles_on_client_id"
  end

  create_table "task_users", id: :serial, force: :cascade do |t|
    t.integer "task_id"
    t.integer "user_id"
    t.integer "task_role_id"
    t.integer "effort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_users_on_task_id"
    t.index ["task_role_id"], name: "index_task_users_on_task_role_id"
    t.index ["user_id"], name: "index_task_users_on_user_id"
  end

  create_table "tasks", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "position"
    t.string "name", limit: 255
    t.float "duration"
    t.integer "schedule_id"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date_before_publication"
    t.integer "owner"
    t.boolean "completed"
    t.string "code", limit: 255
    t.integer "level"
    t.string "status", limit: 255
    t.date "start"
    t.date "end"
    t.boolean "startIsMilestone"
    t.boolean "endIsMilestone"
    t.string "depends", limit: 255
    t.integer "progress"
    t.integer "index_number"
    t.date "benchmark"
    t.boolean "production_task"
    t.index ["client_id"], name: "index_tasks_on_client_id"
    t.index ["schedule_id"], name: "index_tasks_on_schedule_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "temp_migrate_20130411095826_old_prices", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "book_id"
    t.string "price_type", limit: 255
    t.string "price_amount", limit: 255
    t.string "tax_rate_code", limit: 255
    t.string "tax_rate_percent", limit: 255
    t.string "currency_code", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "taxable_amount", limit: 255
    t.string "tax_value", limit: 255
    t.string "discount_code_type", limit: 255
    t.string "discount_code", limit: 255
    t.integer "supplydetail_id"
    t.boolean "defaultprice"
    t.integer "client_id"
    t.integer "user_id"
    t.date "valid_until"
  end

  create_table "temp_migrate_20130411095826_old_supplydetails", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "supplier_role", limit: 255
    t.string "supplier_name", limit: 255
    t.string "product_availability", limit: 255
    t.string "supply_date_role", limit: 255
    t.string "unpriced_item_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "book_id"
    t.integer "supply_id"
    t.date "date"
    t.integer "client_id"
    t.integer "user_id"
    t.string "availability_code", limit: 255
  end

  create_table "territories", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.text "description"
    t.text "countries", array: true
    t.text "countries_excluded", array: true
    t.text "territories", array: true
    t.text "territories_excluded", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "world"
    t.index ["client_id", "name"], name: "index_territories_on_client_id_and_name"
  end

  create_table "test", id: false, force: :cascade do |t|
    t.decimal "col1"
    t.boolean "col2", default: false, null: false
  end

  create_table "things", force: :cascade do |t|
    t.string "name"
    t.string "proprietary_name"
    t.string "string"
    t.integer "proprietary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tmp_cleanup_supply_contacts_bkp", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "person_name_inverted", limit: 255
    t.string "titles_before_names", limit: 255
    t.string "names_before_key", limit: 255
    t.string "keynames", limit: 255
    t.string "corporate_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cross_accounting", limit: 255
    t.integer "client_id"
    t.string "alternative_name_type", limit: 255
    t.string "alternative_names_before_key", limit: 255
    t.string "alternative_key_names", limit: 255
    t.string "contributor_type", limit: 255
    t.string "association_type", limit: 255
    t.integer "assoc_contributor_id"
    t.integer "user_id"
    t.text "biographical_note"
    t.date "last_statement_date"
    t.string "sort_code", limit: 255
    t.string "account_number", limit: 255
    t.string "account_name", limit: 255
    t.string "bank_name", limit: 255
    t.string "bank_address_one", limit: 255
    t.string "bank_address_two", limit: 255
    t.string "bank_address_three", limit: 255
    t.string "bank_address_four", limit: 255
    t.string "swift_code", limit: 255
    t.string "routing", limit: 255
    t.boolean "set_as_default_address"
    t.string "preferred_time_for_phone_interviews", limit: 255
    t.string "place_of_birth", limit: 255
    t.string "citizenship", limit: 255
    t.boolean "children"
    t.text "reader_questions"
    t.text "suggestions_for_back_matter"
    t.text "suggestions_for_cover"
    t.integer "owner"
    t.string "keyname_prefix", limit: 255
    t.string "name_after_keyname", limit: 255
    t.string "suffix_after_keyname", limit: 255
    t.string "qualification_after_keyname", limit: 255
    t.string "titles_after_names", limit: 255
    t.date "date_of_birth"
    t.string "person_name", limit: 255
    t.integer "currency_id"
    t.decimal "cost_per_kilo"
    t.decimal "cost_per_pallet"
    t.text "default_shipping_instructions"
    t.string "twitter_name_", limit: 255
    t.integer "creator_1_id"
    t.integer "creator_2_id"
    t.integer "creator_3_id"
    t.integer "contact_marketing_item_id"
    t.integer "marketing_item_id"
    t.string "default_report", limit: 255
    t.string "default_book_set", limit: 255
    t.integer "book_collection_id"
    t.string "default_report_delivery", limit: 255
    t.integer "digital_asset_subtype_id"
    t.string "location", limit: 255
    t.boolean "is_a_single_name_person"
    t.text "supplier_ref"
    t.text "customer_ref"
    t.integer "distributor_max_title_length"
    t.string "supplier_name", limit: 255
    t.string "supplier_telephone_number", limit: 255
    t.string "supplier_fax_number", limit: 255
    t.string "supplier_email_address", limit: 255
    t.string "default_supplier_role_code", limit: 255
  end

  create_table "tmp_cleanup_supply_supplydetail_bkp", id: false, force: :cascade do |t|
    t.integer "id"
    t.string "supplier_role", limit: 255
    t.string "supplier_name", limit: 255
    t.string "product_availability", limit: 255
    t.string "supply_date_role", limit: 255
    t.string "unpriced_item_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "supply_id"
    t.date "date"
    t.integer "client_id"
    t.integer "user_id"
    t.string "availability_code", limit: 255
    t.integer "contact_id"
    t.integer "book_id"
  end

  create_table "tooltips", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.text "content"
    t.string "markup", limit: 255, default: "markdown"
    t.string "locale", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_tooltips_on_user_id"
  end

  create_table "transmissions", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "contact_id"
    t.integer "digital_asset_id"
    t.date "date_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_transmissions_on_client_id"
    t.index ["contact_id"], name: "index_transmissions_on_contact_id"
    t.index ["digital_asset_id"], name: "index_transmissions_on_digital_asset_id"
  end

  create_table "tweets", id: :serial, force: :cascade do |t|
    t.text "tweet_text"
    t.integer "client_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tweetable_id"
    t.string "tweetable_type", limit: 255
    t.index ["tweetable_id", "tweetable_type"], name: "index_tweets_on_tweetable_id_and_tweetable_type"
  end

  create_table "upload_file_types", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.string "name", limit: 255
    t.string "content_type", limit: 255
    t.string "processing_call", limit: 255
    t.text "properties"
    t.string "klass_name", limit: 255
    t.string "contents", limit: 255
    t.text "description"
    t.string "file_extension", limit: 255
    t.index ["client_id"], name: "index_upload_file_types_on_client_id"
  end

  create_table "upload_files", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "status", limit: 255
    t.integer "upload_file_type_id"
    t.string "upload_file_name", limit: 255
    t.integer "upload_file_size"
    t.string "upload_content_type", limit: 255
    t.string "upload_fingerprint", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "duplicate_of", array: true
    t.index ["client_id"], name: "index_upload_files_on_client_id"
    t.index ["upload_file_type_id"], name: "index_upload_files_on_upload_file_type_id"
  end

  create_table "uploads", id: :serial, force: :cascade do |t|
    t.string "file_file_name", limit: 255
    t.integer "file_file_size"
    t.integer "client_id"
    t.integer "user_id"
    t.string "file_content_type", limit: 255
    t.string "file_remote_url", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_uploads_on_client_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 128, default: ""
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "confirmation_token", limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.integer "client_id"
    t.string "invitation_token", limit: 255
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type", limit: 255
    t.string "client_name_requested", limit: 255
    t.string "mode", limit: 255
    t.boolean "forem_admin", default: false
    t.string "forem_state", limit: 255, default: "pending_review"
    t.boolean "forem_auto_subscribe", default: false
    t.integer "imprint_preference_id"
    t.integer "role_preference_id"
    t.integer "group_id"
    t.string "css_preference", limit: 255
    t.integer "schedule_notification"
    t.boolean "needs_to_see_welcome_note"
    t.boolean "want_to_see_metadata"
    t.boolean "want_to_see_production"
    t.boolean "want_to_see_sales"
    t.boolean "want_to_see_reports"
    t.boolean "want_to_see_in_house"
    t.boolean "want_to_see_quick_jump"
    t.datetime "invitation_created_at"
    t.integer "current_task_id"
    t.integer "reports_to_user_id"
    t.string "phone_number", limit: 255
    t.string "slack_name"
    t.boolean "needs_to_see_latest_system_message", default: false, null: false
    t.string "image_file_name"
    t.string "unique_session_id", limit: 20
    t.boolean "sales_and_royalties_access", default: true, null: false
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["reports_to_user_id"], name: "index_users_on_reports_to_user_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "validation_templates", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "validation_test_suites", id: :serial, force: :cascade do |t|
    t.integer "validation_template_id"
    t.integer "validation_test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "test_type_eligibility"
    t.index ["validation_test_id", "validation_template_id"], name: "index_validation_test_suites_1"
  end

  create_table "validation_tests", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "predicate"
    t.string "desired_result", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "eligibility", limit: 255
    t.string "recovery_path", limit: 255
    t.string "modelname", limit: 255
    t.string "field_name", limit: 255
    t.integer "identity"
    t.text "note"
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", limit: 255, null: false
    t.integer "item_id", null: false
    t.string "event", limit: 255, null: false
    t.string "whodunnit", limit: 255
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "client_id"
    t.integer "book_id"
    t.index ["book_id", "item_type"], name: "index_versions_on_book_id_and_item_type"
    t.index ["id"], name: "index_versions_on_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["whodunnit", "created_at"], name: "index_versions_on_whodunnit_and_created_at"
  end

  create_table "web_links", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "website_role", limit: 255
    t.text "website_link"
    t.integer "linkable_id"
    t.string "linkable_type", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
  end

  create_table "webs", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "old_book_id"
    t.integer "user_id"
    t.index ["book_id"], name: "index_webs_on_book_id"
    t.index ["client_id"], name: "index_webs_on_client_id"
    t.index ["old_book_id"], name: "index_webs_on_old_book_id"
    t.index ["user_id"], name: "index_webs_on_user_id"
  end

  create_table "wedge_elements", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.boolean "handles_lists"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "output_is_list"
    t.integer "input_type_id"
    t.integer "output_type_id"
    t.integer "output_wedge_id"
  end

  create_table "wedge_elements_wedges", id: false, force: :cascade do |t|
    t.integer "wedge_element_id"
    t.integer "wedge_id"
  end

  create_table "wedges", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.integer "input_type_id"
    t.integer "output_type_id"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_derivations", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "derived_work_id", null: false
    t.integer "original_work_id", null: false
    t.text "derivation_types", default: [], null: false, array: true
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "nominal_order"
    t.index ["derived_work_id", "original_work_id"], name: "index_work_derivations_on_derived_work_id_and_original_work_id", unique: true
    t.index ["original_work_id", "derived_work_id"], name: "index_work_derivations_on_original_work_id_and_derived_work_id", unique: true
  end

  create_table "work_seriesnames", id: :serial, force: :cascade do |t|
    t.integer "work_id"
    t.integer "seriesname_id"
    t.string "number_within_series", limit: 255
    t.string "year_of_annual", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["seriesname_id", "work_id"], name: "index_work_seriesnames_on_seriesname_id_and_work_id", unique: true
    t.index ["work_id", "seriesname_id"], name: "index_work_seriesnames_on_work_id_and_seriesname_id", unique: true
  end

  create_table "work_similars", id: :serial, force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "work_id", null: false
    t.integer "similar_book_id", null: false
    t.index ["similar_book_id", "work_id"], name: "index_work_similars_on_similar_book_id_and_work_id"
    t.index ["work_id", "similar_book_id"], name: "index_work_similars_on_work_id_and_similar_book_id"
  end

  create_table "work_subject_contacts", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "work_id"
    t.integer "subject_contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["subject_contact_id", "work_id"], name: "index_work_subject_contacts_on_subject_contact_id_and_work_id", unique: true
    t.index ["work_id", "subject_contact_id"], name: "index_work_subject_contacts_on_work_id_and_subject_contact_id", unique: true
  end

  create_table "work_subjectcodes", id: :serial, force: :cascade do |t|
    t.integer "work_id"
    t.integer "subjectcode_id"
    t.datetime "created_at"
    t.index ["subjectcode_id", "work_id"], name: "index_work_subjectcodes_on_subjectcode_id_and_work_id"
    t.index ["work_id", "subjectcode_id"], name: "index_work_subjectcodes_on_work_id_and_subjectcode_id"
  end

  create_table "work_unnamed_people", id: :serial, force: :cascade do |t|
    t.integer "work_id"
    t.string "unnamed_person_code", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["work_id"], name: "index_work_unnamed_people_on_work_id"
  end

  create_table "work_users", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.integer "task_role_id"
    t.integer "work_id"
    t.integer "effort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_users_on_user_id"
    t.index ["work_id"], name: "index_work_users_on_work_id"
  end

  create_table "workcontacts", id: :serial, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "work_id"
    t.string "work_contact_role", limit: 255
    t.integer "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_role_id"
    t.integer "sequence_number"
    t.integer "altcontact_id"
    t.integer "sequence_number_within_role"
    t.text "biographical_note"
    t.boolean "suppress_biographical_note"
    t.text "contributor_description"
    t.text "country_code_array", array: true
    t.text "region_code_array", array: true
    t.text "languages_to", array: true
    t.text "languages_from", default: [], null: false, array: true
    t.text "contact_work_information"
    t.index ["altcontact_id"], name: "index_workcontacts_on_altcontact_id"
    t.index ["client_id"], name: "index_workcontacts_on_client_id"
    t.index ["contact_id"], name: "index_workcontacts_on_contact_id"
    t.index ["contact_role_id"], name: "index_workcontacts_on_contact_role_id"
    t.index ["work_id"], name: "index_workcontacts_on_work_id"
  end

  create_table "works", id: :serial, force: :cascade do |t|
    t.string "registrants_internal_reference", limit: 255
    t.string "istc_reference", limit: 255
    t.string "istc_request_status", limit: 255
    t.text "istc_request_performed_date"
    t.string "istc_work_type", limit: 255
    t.string "origination", limit: 255
    t.string "derivation_type", limit: 255
    t.string "derivation_note", limit: 255
    t.string "derivation_source_istc", limit: 255
    t.string "istc_title_type", limit: 255
    t.string "title_script", limit: 255
    t.string "title", limit: 255
    t.string "subtitle", limit: 255
    t.string "edition_number", limit: 255
    t.string "edition_statement", limit: 255
    t.string "work_date_role", limit: 255
    t.string "work_date_calendar", limit: 255
    t.string "language_of_text", limit: 255
    t.string "istc_registrant_role", limit: 255
    t.string "registrant_id_value", limit: 255
    t.string "registrant_name", limit: 255
    t.string "query_existing_istc", limit: 255
    t.string "preferred_istc", limit: 255
    t.string "user_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contract_id"
    t.date "work_date"
    t.integer "client_id"
    t.string "acquisition_status", limit: 255
    t.integer "owner"
    t.string "main_subject", limit: 255
    t.string "main_bic_code", limit: 255
    t.string "main_bisac_code", limit: 255
    t.integer "altcontact_id"
    t.integer "books_count", default: 0, null: false
    t.boolean "skip_contract_sign_off"
    t.date "sign_off_meeting_date"
    t.text "printing_restrictions"
    t.decimal "confirmed_contribution"
    t.boolean "non_book_work"
    t.datetime "child_updated_at"
    t.string "target_gender", limit: 255
    t.string "target_socioeconomic_group", limit: 255
    t.integer "age_range_code_id"
    t.integer "subjectcode_id"
    t.datetime "print_spec_updated_at"
    t.datetime "estimates_updated_at"
    t.integer "seriesname_id"
    t.date "first_pub_date"
    t.integer "imprint_id"
    t.integer "publishername_id"
    t.text "publication_city"
    t.text "publication_country"
    t.string "identifying_isbn13", limit: 255
    t.string "identifying_doi", limit: 255
    t.string "identifying_isrc", limit: 255
    t.boolean "no_contributor"
    t.text "audience_description"
    t.date "public_announcement_date"
    t.date "trade_announcement_date"
    t.text "keywords", array: true
    t.date "pub_date"
    t.integer "marketing_highlight_work_ids", default: [], array: true
    t.boolean "ai_show_imprint_marketing_highlight_work_ids", default: true
    t.integer "ai_show_subject_code_marketing_highlight_work_ids", default: 1
    t.string "online_authorship_description"
    t.boolean "copublishers_share_isbns"
    t.date "planned_first_pub_date"
    t.string "legacy_identifier"
    t.text "copyright_notice"
    t.text "bic_subject_codes", default: [], null: false, array: true
    t.text "bisac_general_codes", default: [], null: false, array: true
    t.text "bisac_geog_codes", default: [], null: false, array: true
    t.text "bisac_history_codes", default: [], null: false, array: true
    t.text "bisac_edu_codes", default: [], null: false, array: true
    t.text "bisac_juvenile_codes", default: [], null: false, array: true
    t.text "bisac_lang_codes", default: [], null: false, array: true
    t.text "bisac_merch_codes", default: [], null: false, array: true
    t.text "bisac_subject_codes", default: [], null: false, array: true
    t.text "bic_geog_codes", default: [], null: false, array: true
    t.text "bic_language_codes", default: [], null: false, array: true
    t.text "bic_time_period_codes", default: [], null: false, array: true
    t.text "bic_edu_codes", default: [], null: false, array: true
    t.text "bic_age_codes", default: [], null: false, array: true
    t.text "bic_special_interest_codes", default: [], null: false, array: true
    t.text "bic_geog_subject_codes", default: [], null: false, array: true
    t.string "thema_main_code"
    t.text "thema_subject_codes", default: [], null: false, array: true
    t.text "thema_geog_codes", default: [], null: false, array: true
    t.text "thema_lang_codes", default: [], null: false, array: true
    t.text "thema_time_codes", default: [], null: false, array: true
    t.text "thema_edu_codes", default: [], null: false, array: true
    t.text "thema_age_codes", default: [], null: false, array: true
    t.text "thema_interest_codes", default: [], null: false, array: true
    t.text "thema_style_codes", default: [], null: false, array: true
    t.string "illustrations_note"
    t.integer "number_of_illustrations"
    t.text "notes_on_comparison_products"
    t.string "license_type", default: "None"
    t.boolean "free_products", default: false, null: false
    t.string "title_acronym"
    t.text "alternative_titles", default: [], array: true
    t.string "year_of_annual", limit: 9
    t.integer "edition"
    t.text "edition_type_codes", default: [], array: true
    t.string "default_price_status", limit: 2, default: "00", null: false
    t.string "lc_control_number"
    t.string "salesforce_uid", limit: 18
    t.integer "copyright_year"
    t.string "main_nur_code", limit: 3
    t.text "additional_nur_codes", default: [], null: false, array: true
    t.boolean "guaranteed_peer_reviewed_content", default: false, null: false
    t.string "legal_deposit_reference"
    t.index ["altcontact_id"], name: "index_works_on_altcontact_id"
    t.index ["client_id", "id", "title"], name: "index_works_on_client_id_and_id_and_title"
    t.index ["client_id", "legacy_identifier"], name: "index_works_on_client_id_and_legacy_identifier"
    t.index ["client_id", "updated_at"], name: "index_works_on_client_id_and_updated_at"
    t.index ["contract_id"], name: "index_works_on_contract_id"
    t.index ["seriesname_id", "id", "title"], name: "index_works_on_seriesname_id_and_id_and_title"
    t.index ["subjectcode_id"], name: "index_works_on_subjectcode_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  create_table "xmlimports", id: :serial, force: :cascade do |t|
    t.string "xml_file_name", limit: 255
    t.string "xml_content_type", limit: 255
    t.integer "xml_file_size"
    t.datetime "xml_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_xmlimports_on_client_id"
    t.index ["user_id"], name: "index_xmlimports_on_user_id"
  end

  create_table "zip_archives", id: :serial, force: :cascade do |t|
    t.integer "client_id"
    t.integer "user_id"
    t.string "zip_file_name", limit: 255
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_zip_archives_on_book_id"
    t.index ["client_id"], name: "index_zip_archives_on_client_id"
  end

  add_foreign_key "bookcontacts", "books", on_delete: :cascade
  add_foreign_key "bookmarketingtexts", "books", on_delete: :cascade
  add_foreign_key "extents", "books", on_delete: :cascade
  add_foreign_key "measurements", "books", on_delete: :cascade
  add_foreign_key "prices", "books", on_delete: :cascade
  add_foreign_key "royalty_batch_book_channels", "royalty_batch_books", name: "fk_royalty_batch_book_channels_royalty_batch_book_id", on_delete: :cascade
  add_foreign_key "royalty_batch_books", "royalty_batches", name: "fk_royalty_batch_books_royalty_batch_id", on_delete: :cascade
  add_foreign_key "royalty_date_escalators", "royalty_specifiers", name: "fk_royalty_date_escalators_royalty_specifier_id", on_delete: :cascade
  add_foreign_key "royalty_discount_escalators", "royalty_specifiers", name: "fk_royalty_discount_escalators_royalty_specifier_id", on_delete: :cascade
  add_foreign_key "royalty_quantity_escalator_channel_rates", "royalty_quantity_escalators", name: "fk_royalty_quantity_escalator_channel_rates_rq_escalator_id", on_delete: :cascade
  add_foreign_key "royalty_quantity_escalators", "royalty_specifiers", name: "fk_royalty_quantity_escalators_royalty_specifier_id", on_delete: :cascade
  add_foreign_key "sale_royalties", "royalty_batch_books", name: "fk_sale_royalties_royalty_batch_book_id", on_delete: :restrict
  add_foreign_key "task_users", "tasks", name: "fk_task_users_task_id", on_delete: :cascade
  add_foreign_key "tasks", "schedules", name: "fk_tasks_schedule_id", on_delete: :cascade
end
