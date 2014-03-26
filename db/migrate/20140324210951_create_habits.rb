class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :description
      t.boolean :done
      t.integer :interval

      t.timestamps
    end
  end
end
