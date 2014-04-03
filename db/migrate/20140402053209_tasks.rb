class Tasks < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE tasks ALTER COLUMN progress TYPE integer USING (progress::integer)'
  end

  def down
  	execute 'ALTER TABLE tasks ALTER COLUMN progress TYPE text USING (progress::text)'
  end
end
