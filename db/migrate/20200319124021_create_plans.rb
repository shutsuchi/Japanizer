class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.date :first_date, null: false
      t.date :last_date, null: false
      t.string :budget, null: false
      t.string :mean, null: false
      t.string :purpose, null: false
      t.integer :people
      t.string :memo

      t.timestamps
    end
  end
end
