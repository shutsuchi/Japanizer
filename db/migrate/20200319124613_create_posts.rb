class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :album_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :city_id, null: false
      t.integer :genre_id, null: false
      t.string :image_id
      t.string :title, null: false
      t.float :rate, default: 0.0
      t.text :comment, null: false

      t.timestamps
    end
  end
end
