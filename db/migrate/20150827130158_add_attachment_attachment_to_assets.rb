class AddAttachmentAttachmentToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :assets, :attachment
  end
end
