     t.string "title", limit: 255
     t.text "description"
     t.bigint "category_id", null: false
    t.bigint "user_id", null: false
     t.datetime "created_at", precision: 6, null: false
     t.datetime "updated_at", precision: 6, null: false
     t.integer "price_cents"
     t.index ["category_id"], name: "index_advertisements_on_category_id"
    t.index ["user_id"], name: "index_advertisements_on_user_id"
   end
 
   create_table "categories", force: :cascade do |t|
     t.datetime "updated_at", precision: 6, null: false
   end
 
   create_table "permissions", force: :cascade do |t|
     t.string "name", limit: 255, null: false
     t.datetime "created_at", precision: 6, null: false
   end
 
   create_table "users", force: :cascade do |t|
    t.string "type", limit: 255, null: false
     t.string "name", limit: 255, default: "", null: false
     t.string "email", limit: 255, default: "", null: false
     t.string "encrypted_password", limit: 1024, default: "", null: false
 
   add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
   add_foreign_key "advertisements", "categories"
  add_foreign_key "advertisements", "users"
 end