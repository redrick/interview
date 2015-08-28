class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_title
      t.references :task, index: true

      t.timestamps
    end
  end
end
