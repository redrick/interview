class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :user
      t.string :title, default: '', limit: 64, null: false
      t.text :description
      t.boolean :done, default: false
      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :done
  end
end
