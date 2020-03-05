class AddColumnLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :location, :string
  end
end
