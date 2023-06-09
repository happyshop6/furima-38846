class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,               null: false,foreign_key: true
      t.string  :name,                  null: false
      t.text    :explanation,           null: false
      t.integer :category_id,           null: false
      t.integer :condition_id,          null: false
      t.integer :postage_type_id,       null: false
      t.integer :prefecture_id,         null: false
      t.integer :preparation_day_id,    null: false
      t.integer :price,                 null: false
     

      t.timestamps 
    end
  end
end
