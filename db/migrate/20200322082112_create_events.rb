class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :budget
      t.string :mean
      t.integer :people
      t.string :memo

      t.timestamps
    end
  end
end
