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

ActiveRecord::Schema.define(version: 20141201183304) do

  create_table "academia", force: :cascade do |t|
    t.string   "nome_acad",  limit: 255
    t.string   "localidade", limit: 255
    t.string   "instrutor",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medidas", force: :cascade do |t|
    t.date     "data_medida"
    t.float    "peso",         limit: 24
    t.float    "torax",        limit: 24
    t.float    "ombro",        limit: 24
    t.float    "braco_d",      limit: 24
    t.float    "braco_e",      limit: 24
    t.float    "ante_braco_d", limit: 24
    t.float    "ante_braco_e", limit: 24
    t.float    "cintura",      limit: 24
    t.float    "quadril",      limit: 24
    t.float    "coxa_d",       limit: 24
    t.float    "coxa_e",       limit: 24
    t.float    "perna_d",      limit: 24
    t.float    "perna_e",      limit: 24
    t.text     "obs",          limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medidas", ["user_id"], name: "index_medidas_on_user_id", using: :btree

  create_table "planos", force: :cascade do |t|
    t.string   "desc_plano",  limit: 255
    t.float    "valor_plano", limit: 24
    t.integer  "promo_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "planos", ["promo_id"], name: "index_planos_on_promo_id", using: :btree

  create_table "promos", force: :cascade do |t|
    t.string   "desc_promo",  limit: 255
    t.date     "validade"
    t.float    "porcentagem", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treinos", force: :cascade do |t|
    t.string   "grupo_muscular", limit: 255
    t.string   "desc_exercicio", limit: 255
    t.string   "carga",          limit: 255
    t.integer  "serie",          limit: 4
    t.string   "repeticoes",     limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treinos", ["user_id"], name: "index_treinos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name",              limit: 255
    t.string   "sex",                    limit: 255
    t.date     "birth_date"
    t.float    "stature",                limit: 24
    t.string   "objective",              limit: 255
    t.string   "location",               limit: 255
    t.string   "latitude",               limit: 255
    t.string   "longitude",              limit: 255
    t.integer  "planos_id",              limit: 4
    t.integer  "academias_id",           limit: 4
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "aceite",                 limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
