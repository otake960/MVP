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

ActiveRecord::Schema[7.0].define(version: 2024_05_05_081816) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "muscle_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goal_exercises", force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.bigint "exercise_id", null: false
    t.decimal "target_weight"
    t.integer "repetitions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["exercise_id"], name: "index_goal_exercises_on_exercise_id"
    t.index ["goal_id"], name: "index_goal_exercises_on_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "target_value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "session_exercises", force: :cascade do |t|
    t.bigint "training_session_id", null: false
    t.bigint "exercise_id", null: false
    t.decimal "weight"
    t.integer "sets"
    t.integer "reps"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["exercise_id"], name: "index_session_exercises_on_exercise_id"
    t.index ["training_session_id"], name: "index_session_exercises_on_training_session_id"
  end

  create_table "training_sessions", force: :cascade do |t|
    t.integer "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "goal_exercises", "exercises"
  add_foreign_key "goal_exercises", "goals"
  add_foreign_key "goals", "users"
  add_foreign_key "session_exercises", "exercises"
  add_foreign_key "session_exercises", "training_sessions"
end
