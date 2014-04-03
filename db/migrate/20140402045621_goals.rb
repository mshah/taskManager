class Goals < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :goals do |t|
        dir.up   { t.change :progress, :integer :default => 0}
        dir.down { t.change :progress, :string  :default => "Complete"}
      end
    end
  end
end