       t.string :title, limit: 255
       t.text :description
       t.references :category, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
 
       t.timestamps
     end