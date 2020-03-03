class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.boolean :available
      t.decimal :price_per_day
      t.string :brand
      t.string :model
      t.text :product_description
      t.string :equipment_category
      t.text :user_description
      t.string :condition

      t.timestamps
    end
  end
end
