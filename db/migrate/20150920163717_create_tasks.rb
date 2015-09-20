class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name,       null: false
      t.text :description
      t.boolean :completed, default: false
      t.integer :position,  null: false

      t.timestamps
    end
  end
end
