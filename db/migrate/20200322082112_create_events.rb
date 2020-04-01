class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title
      t.text :body
      t.datetime :start
      t.datetime :end
      t.string :allday

      t.timestamps
    end
  end
end
