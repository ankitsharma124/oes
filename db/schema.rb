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

ActiveRecord::Schema.define(version: 2020_08_15_234920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_logins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.boolean "is_paid", default: false
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "test_id"
    t.string "titel"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.string "correct_option"
    t.integer "mark"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sort_order"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "standards", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "name"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_standards_on_organization_id"
  end

  create_table "student_tests", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "test_id"
    t.datetime "assign_start_date"
    t.datetime "assign_end_date"
    t.datetime "actual_start_date"
    t.datetime "actual_end_date"
    t.boolean "has_started", default: false
    t.boolean "has_completed", default: false
    t.integer "current_question"
    t.integer "marks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_student_tests_on_student_id"
    t.index ["test_id"], name: "index_student_tests_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "last_name"
    t.string "first_name"
    t.string "father_name"
    t.date "dob"
    t.string "gender"
    t.date "joining_date"
    t.string "roll_number"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_students_on_organization_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "standard_id"
    t.string "name"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["standard_id"], name: "index_subjects_on_standard_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "last_name"
    t.string "first_name"
    t.date "dob"
    t.string "gender"
    t.date "joining_date"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_teachers_on_organization_id"
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "standard_id"
    t.string "title"
    t.integer "total_marks"
    t.integer "total_question"
    t.integer "minute_per_question"
    t.boolean "negative_marking", default: false
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "passing_marks"
    t.index ["standard_id"], name: "index_tests_on_standard_id"
    t.index ["subject_id"], name: "index_tests_on_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "role_id", null: false
    t.datetime "create_at"
    t.boolean "del_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "organizations"
  add_foreign_key "users", "roles"
end
