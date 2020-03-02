class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :item, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
