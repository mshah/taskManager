class CalculateGoalProgress < ActiveRecord::Migration
  def self.up
    remove_column :goals, :progress
  end

  def self.down
    add_column :goals, :progress, :integer, :default => 0
  end
end
