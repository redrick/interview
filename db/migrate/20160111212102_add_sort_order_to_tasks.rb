class AddSortOrderToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :sort_order, :integer, default: 0
    add_index :tasks, :sort_order
  end
end
