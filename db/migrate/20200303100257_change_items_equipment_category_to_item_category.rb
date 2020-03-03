class ChangeItemsEquipmentCategoryToItemCategory < ActiveRecord::Migration[5.2]
  def change
     rename_column :items, :equipment_category, :item_category
  end
end
