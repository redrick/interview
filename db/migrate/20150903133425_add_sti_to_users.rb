class AddStiToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.column :type, :string, limit: 10, default: 'Manager'
      t.index :type
    end
    User.update_all type: 'Manager'
  end
end
