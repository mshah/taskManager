class AddGoalIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :goal_id, :integer
    add_index :tasks, :goal_id
  end
end
