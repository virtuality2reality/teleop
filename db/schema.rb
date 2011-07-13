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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110711145632) do

  create_table "answers", :force => true do |t|
    t.integer   "question_id"
    t.integer   "choice_id"
    t.integer   "call_id"
    t.string    "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "calls", :force => true do |t|
    t.integer   "survey_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.datetime  "posted_at"
  end

  create_table "choices", :force => true do |t|
    t.integer   "question_id"
    t.string    "ext_id"
    t.string    "title"
    t.integer   "position"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "dependencies", :force => true do |t|
    t.integer   "question_id"
    t.integer   "choice_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string    "ext_id"
    t.string    "typ"
    t.string    "title"
    t.integer   "position"
    t.integer   "section_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "required"
  end

  create_table "roles", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sections", :force => true do |t|
    t.string    "title"
    t.integer   "position"
    t.integer   "survey_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string    "ext_id"
    t.string    "title"
    t.integer   "client_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
