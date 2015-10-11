class Task < ActiveRecord::Base

  default_scope { order(:order) }

  scope :active,    -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  belongs_to :user

  before_create do
    self.order = user.tasks.count
  end

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :description, presence: true

  def completed?
    !!completed_at
  end

  def toggle_completed_at
    self.completed_at = completed_at.blank? ? Time.current : nil
    save
  end

  def destroy_attachment
    self.attachment = nil
    save
  end

end
