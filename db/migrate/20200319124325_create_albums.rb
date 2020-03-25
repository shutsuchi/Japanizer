class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :image_id
      t.integer :post_quantity, null: false, default: 0
      t.text :comment
      t.float :rate, null: false

      t.timestamps
    end
  end
end
