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

ActiveRecord::Schema[7.0].define(version: 2024_02_05_181947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academies", id: :bigint, default: nil, force: :cascade do |t|
    t.text "edition_number"
    t.text "package"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "season"
    t.text "status", default: "upcoming"
    t.text "name"
    t.text "image_url"
  end

  create_table "academy_sponsors", force: :cascade do |t|
    t.bigint "academy_id"
    t.text "name"
    t.text "description"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "image_url"
    t.index ["academy_id"], name: "idx_17264_index_academy_sponsors_on_academy_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.text "name"
    t.text "address"
    t.text "contact_full_name"
    t.text "contact_phone_number"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "clubs_users", id: false, force: :cascade do |t|
    t.bigint "club_id"
    t.bigint "user_id"
    t.index ["club_id", "user_id"], name: "idx_17339_index_clubs_users_on_club_id_and_user_id"
    t.index ["user_id", "club_id"], name: "idx_17339_index_clubs_users_on_user_id_and_club_id"
  end

  create_table "flights", force: :cascade do |t|
    t.bigint "round_id"
    t.text "tee_time"
    t.text "hole"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["round_id"], name: "idx_17326_index_flights_on_round_id"
  end

  create_table "homeblocks", force: :cascade do |t|
    t.text "box_type"
    t.text "title"
    t.text "lower_text"
    t.text "redirect_url"
    t.text "role"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "league_registrations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "league_id"
    t.boolean "current", default: true
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["league_id"], name: "idx_17353_index_league_registrations_on_league_id"
    t.index ["user_id"], name: "idx_17353_index_league_registrations_on_user_id"
  end

  create_table "league_rewards", force: :cascade do |t|
    t.bigint "league_id"
    t.text "prize"
    t.text "condition"
    t.text "sponsor"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["league_id"], name: "idx_17377_index_league_rewards_on_league_id"
  end

  create_table "league_sponsors", force: :cascade do |t|
    t.bigint "league_id"
    t.text "name"
    t.text "description"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "image_url"
    t.index ["league_id"], name: "idx_17291_index_league_sponsors_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "edition_number"
    t.string "package"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "upcoming", null: false
    t.string "name"
    t.string "date"
    t.string "classification"
    t.string "image_url"
    t.index ["name"], name: "index_leagues_on_name", unique: true
  end

  create_table "lesson_rewards", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "lesson_id"
    t.text "sponsor"
    t.text "condition"
    t.text "prize"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["lesson_id"], name: "idx_17389_index_lesson_rewards_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "academy_id"
    t.date "date"
    t.text "place"
    t.text "description"
    t.text "freebie"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "name"
    t.index ["academy_id"], name: "idx_17271_index_lessons_on_academy_id"
  end

  create_table "lessons_academies", id: false, force: :cascade do |t|
    t.bigint "lesson_id"
    t.bigint "academy_id"
    t.index ["academy_id"], name: "idx_17287_index_lessons_academies_on_academy_id"
    t.index ["lesson_id"], name: "idx_17287_index_lessons_academies_on_lesson_id"
  end

  create_table "lessons_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "idx_17349_index_lessons_users_on_lesson_id"
    t.index ["user_id"], name: "idx_17349_index_lessons_users_on_user_id"
  end

  create_table "round_contests", force: :cascade do |t|
    t.bigint "round_id"
    t.text "name"
    t.text "description"
    t.text "prize"
    t.text "hole"
    t.text "sponsor"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["round_id"], name: "idx_17312_index_round_contests_on_round_id"
  end

  create_table "round_results", force: :cascade do |t|
    t.bigint "round_id"
    t.text "classification"
    t.text "prize"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["round_id"], name: "idx_17319_index_round_results_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "tournament_id"
    t.date "date"
    t.text "description"
    t.text "place"
    t.text "golf_course"
    t.bigint "num_rounds"
    t.text "hcp"
    t.text "criteria"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["tournament_id"], name: "idx_17305_index_rounds_on_tournament_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "academy_id"
    t.date "date"
    t.text "description"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["academy_id"], name: "idx_17257_index_schedules_on_academy_id"
  end

  create_table "tournament_registrations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tournament_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_tournament_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_registrations_on_user_id"
  end

  create_table "tournament_results", force: :cascade do |t|
    t.bigint "tournament_id"
    t.text "classification"
    t.text "prize"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["tournament_id"], name: "idx_17298_index_tournament_results_on_tournament_id"
  end

  create_table "tournament_rewards", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "tournament_id"
    t.text "prize"
    t.text "condition"
    t.text "sponsor"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["tournament_id"], name: "idx_17364_index_tournament_rewards_on_tournament_id"
  end

  create_table "tournament_sponsors", force: :cascade do |t|
    t.bigint "tournament_id"
    t.text "name"
    t.text "image_url"
    t.text "description"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["tournament_id"], name: "idx_17370_index_tournament_sponsors_on_tournament_id"
  end

  create_table "tournaments", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "league_id"
    t.date "date"
    t.text "place"
    t.text "name"
    t.bigint "num_rounds"
    t.bigint "cost"
    t.bigint "additional_costs"
    t.text "formula"
    t.text "package"
    t.bigint "min_players"
    t.bigint "max_players"
    t.text "hcp"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "status", default: "upcoming"
    t.bigint "holes"
    t.text "additional_information"
    t.text "time"
    t.text "gen_classification"
    t.text "image_url"
    t.index ["league_id"], name: "idx_17394_index_tournaments_on_league_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.bigint "lesson_id"
    t.text "name"
    t.text "description"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.index ["lesson_id"], name: "idx_17278_index_trainers_on_lesson_id"
  end

  create_table "trainers_lessons", id: false, force: :cascade do |t|
    t.bigint "trainer_id"
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "idx_17284_index_trainers_lessons_on_lesson_id"
    t.index ["trainer_id"], name: "idx_17284_index_trainers_lessons_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", default: ""
    t.text "encrypted_password", default: ""
    t.text "reset_password_token"
    t.timestamptz "reset_password_sent_at"
    t.timestamptz "remember_created_at"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.text "role"
    t.text "first_name"
    t.text "last_name"
    t.text "address"
    t.text "phone"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.boolean "allow_password_change", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "idx_17248_index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "idx_17248_index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "league_registrations", "leagues", name: "league_registrations_league_id_fkey"
  add_foreign_key "league_registrations", "users", name: "league_registrations_user_id_fkey"
  add_foreign_key "tournament_registrations", "tournaments"
  add_foreign_key "tournament_registrations", "users"
end
