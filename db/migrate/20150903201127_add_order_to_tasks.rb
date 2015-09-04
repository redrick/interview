class AddOrderToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.integer :order
    end
  end
end
