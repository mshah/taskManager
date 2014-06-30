class AddGoalUserToBehaviors < ActiveRecord::Migration
  def change
    add_column :behaviors, :user_id, :integer
    add_index :behaviors, :user_id
    add_column :behaviors, :goal_id, :integer
    add_index :behaviors, :goal_id
  end
end
