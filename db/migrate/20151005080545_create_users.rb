class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :email, null: false
      t.string :phone
      t.string :type

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
