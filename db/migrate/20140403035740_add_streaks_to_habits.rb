class AddStreaksToHabits < ActiveRecord::Migration
  def change
    add_column :habits, :streak, :integer, :default => 0
  end

end
