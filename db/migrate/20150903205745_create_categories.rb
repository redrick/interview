class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    change_table :tasks do |t|
      t.references :category
    end
  end
end
