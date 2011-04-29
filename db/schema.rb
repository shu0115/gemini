# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110427041403) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "mail_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "group_members", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "mail_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "send_mail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mail_templates", :force => true do |t|
    t.integer  "user_id"
    t.string   "from"
    t.string   "to"
    t.string   "cc"
    t.string   "bcc"
    t.string   "subject"
    t.text     "body"
    t.string   "reply_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "receptions", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "mail_address"
    t.string   "attend"
    t.datetime "mail_send_at"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sent_mails", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "cc"
    t.string   "bcc"
    t.string   "subject"
    t.text     "body"
    t.string   "reply_to"
    t.datetime "mail_send_at"
    t.text     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operation_user_id"
    t.integer  "group_id"
    t.integer  "mail_template_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login_id"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "display_name"
    t.string   "level"
    t.string   "twitter_id"
    t.string   "mail_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
