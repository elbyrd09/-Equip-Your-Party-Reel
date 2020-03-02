class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.date :start_dat
      t.date :end_date
      t.decimal :total_price

      t.timestamps
    end
  end
end
