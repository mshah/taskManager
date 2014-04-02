class Goals < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :goals do |t|
        dir.up   { t.change :progress, :integer }
        dir.down { t.change :progress, :string }
      end
    end
  end
end