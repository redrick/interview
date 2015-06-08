class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id      # task has its owner/creator/user
      t.integer :category_id  # task has its category
      
      t.string :text
      t.boolean :done, default: false  # by default, task is NOT done

      t.timestamps
    end
  end
end
