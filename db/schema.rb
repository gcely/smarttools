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

ActiveRecord::Schema.define(version: 20160904224150) do

  create_table "archivos", force: :cascade do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "email"
    t.string   "video"
    t.string   "mensaje"
    t.string   "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "concurso_id"
    t.index ["concurso_id"], name: "index_archivos_on_concurso_id"
  end

  create_table "concursos", id: false, force: :cascade do |t|
    t.string   "namec"
    t.string   "banner"
    t.string   "url"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.text     "premio"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["url"], name: "index_products_on_url", unique: true
    t.index ["user_id"], name: "index_concursos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
