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

ActiveRecord::Schema.define(version: 20160730181823) do

  create_table "pedidos", primary_key: "id_pedidos", force: :cascade do |t|
    t.string  "nombre_cliente",   limit: 50,  null: false
    t.string  "apellido_paterno", limit: 50,  null: false
    t.string  "apellido_materno", limit: 50,  null: false
    t.date    "fecha",                        null: false
    t.time    "hora",                         null: false
    t.string  "direccion",        limit: 100, null: false
    t.string  "telefono",         limit: 15,  null: false
    t.integer "usuario_fk",       limit: 4,   null: false
  end

  add_index "pedidos", ["usuario_fk"], name: "FK_usuario", using: :btree

  create_table "platillo_pedidos", id: false, force: :cascade do |t|
    t.integer "id_pla_ped", limit: 4, null: false
    t.integer "platillo",   limit: 4, null: false
    t.integer "pedido",     limit: 4, null: false
    t.integer "cantidad",   limit: 4, null: false
  end

  add_index "platillo_pedidos", ["pedido"], name: "pedido_fk", using: :btree
  add_index "platillo_pedidos", ["platillo"], name: "platillo_fk", using: :btree

  create_table "platillos", primary_key: "id_platillo", force: :cascade do |t|
    t.string "nombre",      limit: 50,  null: false
    t.string "descripcion", limit: 255, null: false
    t.float  "precio",      limit: 53,  null: false
    t.string "tamanio",     limit: 50,  null: false
  end

  create_table "producto_platillos", id: false, force: :cascade do |t|
    t.integer "id_pro_pla",    limit: 4,  null: false
    t.integer "producto",      limit: 4,  null: false
    t.integer "platillo",      limit: 4,  null: false
    t.integer "cantidad",      limit: 4,  null: false
    t.string  "unidad_medida", limit: 50, null: false
  end

  add_index "producto_platillos", ["platillo"], name: "FK_platillo", using: :btree
  add_index "producto_platillos", ["producto"], name: "FK_producto", using: :btree

  create_table "productos", primary_key: "id_producto", force: :cascade do |t|
    t.string  "nombre",          limit: 50, null: false
    t.date    "fecha_caducidad",            null: false
    t.integer "stock",           limit: 4,  null: false
    t.integer "cantidad_maxima", limit: 4,  null: false
    t.string  "categoria",       limit: 50, null: false
    t.string  "unidad_medida",   limit: 50, null: false
    t.integer "proveedor_fk",    limit: 4,  null: false
  end

  add_index "productos", ["proveedor_fk"], name: "FK_proveedor", using: :btree

  create_table "proveedores", primary_key: "id_proveedor", force: :cascade do |t|
    t.string "rfc",       limit: 13,  null: false
    t.string "nombre",    limit: 100, null: false
    t.string "direccion", limit: 100, null: false
    t.string "telefono",  limit: 15,  null: false
    t.string "correo",    limit: 50,  null: false
  end

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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "lastname",               limit: 255
    t.string   "phone",                  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usuarios", primary_key: "id_usuarios", force: :cascade do |t|
    t.string "nombre",           limit: 50,  null: false
    t.string "apellido_paterno", limit: 50,  null: false
    t.string "apellido_materno", limit: 50,  null: false
    t.string "telefono",         limit: 15,  null: false
    t.string "direccion",        limit: 100, null: false
    t.string "usuario",          limit: 50,  null: false
    t.string "password",         limit: 50,  null: false
  end

  create_table "venta", primary_key: "id_venta", force: :cascade do |t|
    t.date    "fecha",                null: false
    t.time    "hora",                 null: false
    t.float   "total",     limit: 53, null: false
    t.float   "subtotal",  limit: 53, null: false
    t.integer "pedido_fk", limit: 4,  null: false
  end

  add_index "venta", ["pedido_fk"], name: "FK_pedido", using: :btree

end
