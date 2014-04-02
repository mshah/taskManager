class AddGoalIdToHabits < ActiveRecord::Migration
  def change
    add_column :habits, :goal_id, :integer
    add_index :habits, :goal_id
  end
end
