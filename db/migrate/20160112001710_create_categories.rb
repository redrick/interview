class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 32
      t.references :user
      t.timestamps
    end
  end
end
