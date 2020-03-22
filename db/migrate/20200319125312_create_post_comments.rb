class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :title, null: false
      t.text :comment, null: false
      t.float :rate, null: false, default: 0.0

      t.timestamps
    end
  end
end
