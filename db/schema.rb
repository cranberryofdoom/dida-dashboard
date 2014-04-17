# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140416230308) do

  create_table "clients", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "department"
    t.integer  "cell"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["client_id"], name: "index_organizations_on_client_id"

  create_table "posts", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.string   "attached_file_file_name"
    t.string   "attached_file_content_type"
    t.integer  "attached_file_file_size"
    t.datetime "attached_file_updated_at"
    t.string   "direct_upload_url"
    t.string   "attached_file_file_path"
  end

  create_table "projects", force: true do |t|
    t.string   "mediums_json"
    t.string   "kind"
    t.string   "status"
    t.date     "due_date"
    t.text     "details"
    t.text     "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "file"
    t.string   "files_file_name"
    t.string   "files_content_type"
    t.integer  "files_file_size"
    t.datetime "files_updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id"
  add_index "projects", ["team_id"], name: "index_projects_on_team_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams_users", id: false, force: true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  add_index "teams_users", ["team_id"], name: "index_teams_users_on_team_id"
  add_index "teams_users", ["user_id"], name: "index_teams_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "netid"
    t.string   "status"
    t.string   "payroll"
    t.string   "year"
    t.string   "position"
    t.string   "privilege"
    t.string   "area"
    t.string   "cell"
    t.datetime "start_date"
    t.boolean  "admin",                  default: false
    t.boolean  "project_manager",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
