class Goals < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE goal ALTER COLUMN progress TYPE integer USING (progress::integer)'
  end

  def down
  	execute 'ALTER TABLE goal ALTER COLUMN progress TYPE text USING (progress::text)'
  end
end