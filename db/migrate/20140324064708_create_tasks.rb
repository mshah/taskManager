class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.timestamp :dueDate
  	  t.string :progress
  	  
      t.timestamps
    end
  end
end
