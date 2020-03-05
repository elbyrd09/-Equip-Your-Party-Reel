class ChangeNameAddressItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :location, :address
  end
end
