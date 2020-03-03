class UpdateRentalPriceTypeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :rentals, :total_price, :float
  end
end
