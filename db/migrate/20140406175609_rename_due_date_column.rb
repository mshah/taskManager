class RenameDueDateColumn < ActiveRecord::Migration
  def self.up
    add_column :tasks, :due_date, :datetime
    remove_column :tasks, :dueDate
  end

  def self.down
    add_column :tasks, :dueDate, :datetime
    remove_column :tasks, :due_date
  end
end
