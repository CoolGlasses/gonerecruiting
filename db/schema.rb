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

ActiveRecord::Schema.define(version: 2020_08_04_234039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "btree_gist"
  enable_extension "citext"
  enable_extension "cube"
  enable_extension "dblink"
  enable_extension "dict_int"
  enable_extension "dict_xsyn"
  enable_extension "earthdistance"
  enable_extension "fuzzystrmatch"
  enable_extension "hstore"
  enable_extension "intarray"
  enable_extension "ltree"
  enable_extension "pg_stat_statements"
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "pgrowlocks"
  enable_extension "pgstattuple"
  enable_extension "plpgsql"
  enable_extension "plv8"
  enable_extension "tablefunc"
  enable_extension "unaccent"
  enable_extension "uuid-ossp"
  enable_extension "xml2"

  create_table "athletic_directors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "school_id"
    t.string "phone"
    t.string "email"
    t.string "cell"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string "name", null: false
    t.string "cell"
    t.string "phone"
    t.string "email"
    t.integer "team_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conferences", force: :cascade do |t|
    t.string "name", null: false
    t.integer "classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_cards", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "user_id", null: false
    t.string "street"
    t.string "email"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "cell"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_contact_cards_on_player_id"
    t.index ["user_id"], name: "index_contact_cards_on_user_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "status"
    t.string "start_at"
    t.integer "home_id"
    t.boolean "home_win"
    t.boolean "home_tie"
    t.boolean "home_forfeit"
    t.integer "home_score"
    t.string "home_name"
    t.integer "away_id"
    t.boolean "away_win"
    t.boolean "away_tie"
    t.boolean "away_forfeit"
    t.integer "away_score"
    t.string "away_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_id"], name: "index_contests_on_away_id"
    t.index ["home_id"], name: "index_contests_on_home_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title", null: false
    t.string "textarea"
    t.string "author", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "user_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_notes_on_player_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "paid", default: false
    t.string "token"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "position"
    t.string "height"
    t.string "grade"
    t.string "home_number"
    t.string "away_number"
    t.integer "team_id", null: false
    t.integer "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "height_inches"
    t.string "school_name"
    t.string "classification"
    t.string "mascot"
    t.string "color_1"
    t.string "color_2"
    t.string "league"
    t.string "state"
    t.index ["height_inches"], name: "index_players_on_height_inches"
    t.index ["school_name"], name: "index_players_on_school_name"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "product_code"
    t.string "description"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "paypal_plan_name"
    t.string "stripe_plan_name"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.index ["product_code"], name: "index_products_on_product_code"
  end

  create_table "recruits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_recruits_on_player_id"
    t.index ["user_id"], name: "index_recruits_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "mascot"
    t.integer "league"
    t.string "color_1"
    t.string "color_2"
    t.string "color_3"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "osaa_school_id"
    t.string "social_media"
    t.integer "classification"
    t.string "state"
    t.index ["osaa_school_id"], name: "index_schools_on_osaa_school_id", unique: true
  end

  create_table "targetgames", force: :cascade do |t|
    t.integer "user_id"
    t.integer "contest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contest_id"], name: "index_targetgames_on_contest_id"
    t.index ["user_id"], name: "index_targetgames_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "school_id"
    t.integer "coach_id"
    t.integer "club_id"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.integer "osaa_school_id"
    t.integer "osaa_team_id"
    t.string "social_media"
    t.string "team_photo_url"
    t.index ["osaa_school_id"], name: "index_teams_on_osaa_school_id", unique: true
    t.index ["osaa_team_id"], name: "index_teams_on_osaa_team_id", unique: true
  end

  create_table "todos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "player_id"
    t.integer "contest_id"
    t.datetime "due_by"
    t.integer "duration"
    t.string "description"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_token", null: false
    t.citext "email"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "organization"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
