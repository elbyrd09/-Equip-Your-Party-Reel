class ChangeStartDatToStartDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :rentals, :start_dat, :start_date
  end
end
