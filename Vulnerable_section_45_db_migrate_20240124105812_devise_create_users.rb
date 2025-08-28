   def change
     create_table :users do |t|
       # User data
       t.string :name, null: false, default: "", limit: 255
 
       ## Database authenticatable