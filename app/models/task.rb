class Task < ActiveRecord::Base

  acts_as_sortable

  validates :name, presence: true

  mount_uploader :attachment, AttachmentUploader


  acts_as_sortable do |config|
    config[:append] = true
  end
end
