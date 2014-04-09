class AddStickyToTasks < ActiveRecord::Migration
 # Note: You can't use change, as User.update_all with fail in the down migration
  def self.up
    add_column :tasks, :sticky, :integer, :default => 0
  end

  def self.down
    remove_column :tasks, :sticky
  end
end
