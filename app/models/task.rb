class Task < ActiveRecord::Base

  default_scope { order(:order) }

  scope :active,    -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  belongs_to :user

  before_create do
    self.order = user.tasks.count
  end

  def completed?
    !!completed_at
  end

  def toggle_completed_at
    self.completed_at = completed_at.blank? ? Time.current : nil
    save
  end

end
