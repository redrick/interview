class AddTasksCountsToUsers < ActiveRecord::Migration

  def self.up

    add_column :users, :active_tasks_count, :integer, :null => false, :default => 0
    add_column :users, :completed_tasks_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :users, :active_tasks_count
    remove_column :users, :completed_tasks_count

  end

end
