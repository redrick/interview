class Task < ActiveRecord::Base
  scope :done, -> { where(done: true) }
  scope :undone, -> { where(done: false) }
  
  belongs_to :category
  belongs_to :user
  
  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: 'application/pdf'
  
  validates :title, length: { maximum: 64 }, presence: true
  validates :description, presence: true
end
