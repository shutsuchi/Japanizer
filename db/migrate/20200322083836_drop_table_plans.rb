class DropTablePlans < ActiveRecord::Migration[5.2]
  def up
    drop_table :plans
  end
  def down
  end
end
