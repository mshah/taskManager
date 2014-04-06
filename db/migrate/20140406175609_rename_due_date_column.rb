class RenameDueDateColumn < ActiveRecord::Migration
  # Note: You can't use change, as User.update_all with fail in the down migration
  def self.up
    add_column :tasks, :due_date, :date
    remove_column :tasks, :dueDate
  end

  def self.down
    add_column :tasks, :dueDate, :date
    remove_column :tasks, :due_date
  end
end
