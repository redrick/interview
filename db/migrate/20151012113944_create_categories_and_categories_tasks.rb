class CreateCategoriesAndCategoriesTasks < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.string :name
    end

    create_table :categories_tasks do |t|
      t.references :task
      t.references :category
    end

  end
end
