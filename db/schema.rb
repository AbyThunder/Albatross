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

ActiveRecord::Schema[7.0].define(version: 2023_10_31_002310) do
  create_table "academies", force: :cascade do |t|
    t.integer "edition_number"
    t.string "package"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "season"
    t.string "sponsor"
  end

  create_table "academies_sponsors", id: false, force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "academy_id"
    t.index ["academy_id"], name: "index_academies_sponsors_on_academy_id"
    t.index ["sponsor_id"], name: "index_academies_sponsors_on_sponsor_id"
  end

  create_table "classification_types", force: :cascade do |t|
    t.integer "other_classification_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["other_classification_id"], name: "index_classification_types_on_other_classification_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_full_name"
    t.string "contact_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs_users", id: false, force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "user_id", null: false
    t.index ["club_id", "user_id"], name: "index_clubs_users_on_club_id_and_user_id"
    t.index ["user_id", "club_id"], name: "index_clubs_users_on_user_id_and_club_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.integer "lesson_id"
    t.string "name"
    t.string "description"
    t.string "prize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_competitions_on_lesson_id"
  end

  create_table "extra_contests", force: :cascade do |t|
    t.integer "tournament_id"
    t.string "name"
    t.string "description"
    t.string "prize"
    t.string "hole"
    t.string "sponsor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_extra_contests_on_tournament_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "round_id"
    t.string "tee_time"
    t.string "hole"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_flights_on_round_id"
  end

  create_table "general_classifications", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_general_classifications_on_league_id"
  end

  create_table "general_rewards", force: :cascade do |t|
    t.integer "general_classification_id"
    t.string "name"
    t.string "description"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_classification_id"], name: "index_general_rewards_on_general_classification_id"
  end

  create_table "homeblocks", force: :cascade do |t|
    t.string "box_type"
    t.string "title"
    t.text "lower_text"
    t.string "redirect_url"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "league_registrations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "league_id", null: false
    t.boolean "current", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_registrations_on_league_id"
    t.index ["user_id"], name: "index_league_registrations_on_user_id"
  end

  create_table "league_sponsors", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_league_sponsors_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.integer "edition_number"
    t.string "package"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "academy_id"
    t.date "date"
    t.string "place"
    t.string "description"
    t.string "freebie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_lessons_on_academy_id"
  end

  create_table "lessons_academies", id: false, force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "academy_id"
    t.index ["academy_id"], name: "index_lessons_academies_on_academy_id"
    t.index ["lesson_id"], name: "index_lessons_academies_on_lesson_id"
  end

  create_table "other_classifications", force: :cascade do |t|
    t.integer "league_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_other_classifications_on_league_id"
  end

  create_table "other_rewards", force: :cascade do |t|
    t.integer "classification_type_id"
    t.string "name"
    t.string "description"
    t.string "winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_type_id"], name: "index_other_rewards_on_classification_type_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "tournament_id"
    t.string "classification"
    t.string "prize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_results_on_tournament_id"
  end

  create_table "round_contests", force: :cascade do |t|
    t.integer "round_id"
    t.string "name"
    t.string "description"
    t.string "prize"
    t.string "hole"
    t.string "sponsor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_round_contests_on_round_id"
  end

  create_table "round_results", force: :cascade do |t|
    t.integer "round_id"
    t.string "classification"
    t.string "prize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_round_results_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "tournament_id"
    t.date "date"
    t.string "description"
    t.string "place"
    t.string "golf_course"
    t.integer "num_rounds"
    t.string "hcp"
    t.string "criteria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "academy_id"
    t.date "date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_schedules_on_academy_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.integer "academy_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academy_id"], name: "index_sponsors_on_academy_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "league_id"
    t.date "date"
    t.string "place"
    t.string "name"
    t.integer "num_rounds"
    t.integer "cost"
    t.integer "additional_costs"
    t.string "formula"
    t.string "sponser"
    t.string "package"
    t.integer "min_players"
    t.integer "max_players"
    t.string "hcp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_tournaments_on_league_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.integer "lesson_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_trainers_on_lesson_id"
  end

  create_table "trainers_lessons", id: false, force: :cascade do |t|
    t.integer "trainer_id"
    t.integer "lesson_id"
    t.index ["lesson_id"], name: "index_trainers_lessons_on_lesson_id"
    t.index ["trainer_id"], name: "index_trainers_lessons_on_trainer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_lessons", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.index ["lesson_id"], name: "index_users_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_users_lessons_on_user_id"
  end

  add_foreign_key "league_registrations", "leagues"
  add_foreign_key "league_registrations", "users"
end
