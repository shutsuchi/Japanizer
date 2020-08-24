class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.string :en_name, null: false

      t.timestamps
    end
  end
end
