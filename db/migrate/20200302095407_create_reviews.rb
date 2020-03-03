class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :rental
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
