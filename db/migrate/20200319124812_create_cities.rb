class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.integer :prefecture_id, null: false
      t.string :name, null: false
      t.string :en_name, null: false

      t.timestamps
    end
  end
end
