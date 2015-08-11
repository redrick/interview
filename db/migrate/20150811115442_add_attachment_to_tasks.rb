class AddAttachmentToTasks < ActiveRecord::Migration
  def up
    add_attachment :tasks, :attachment
  end

  def down
    remove_attachment :tasks, :attachment
  end
end
