class UpdateItemsPriceTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price_per_day, :float
  end
end
