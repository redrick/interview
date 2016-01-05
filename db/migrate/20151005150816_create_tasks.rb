class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to  :user,          null: false
      t.text        :description,   null: false
      t.integer     :order
      t.timestamp   :completed_at

      t.timestamps
    end

    add_index :tasks, :user_id
    add_index :tasks, [:user_id, :completed_at]
  end
end
