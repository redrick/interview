class Task < ActiveRecord::Base
  scope :done, -> { where(done: true) }
  scope :undone, -> { where(done: false) }
  
  belongs_to :category
  belongs_to :user
  
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: 'application/pdf'
end
