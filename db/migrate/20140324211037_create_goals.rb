class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
  	  t.string :progress
  	  
      t.timestamps
    end
  end
end
