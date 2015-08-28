class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.string :status
      t.references :category, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
