class Task < ActiveRecord::Base

  validates :name, presence: true

  mount_uploader :attachment, AttachmentUploader
end
