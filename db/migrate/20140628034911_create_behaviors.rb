class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.string :description
      t.timestamp :time

      t.timestamps
    end
  end
end
