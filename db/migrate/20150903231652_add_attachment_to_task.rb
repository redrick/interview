class AddAttachmentToTask < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.string :attachment
    end
  end
end
