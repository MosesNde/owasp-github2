   def change
     create_table :users do |t|
       # User data
      t.string :type, null: false, limit: 255
       t.string :name, null: false, default: "", limit: 255
 
       ## Database authenticatable