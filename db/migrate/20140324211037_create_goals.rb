class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
