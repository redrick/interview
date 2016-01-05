class Task < ActiveRecord::Base

  default_scope { order(:order) }

  scope :active,    -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  belongs_to :user

  counter_culture :user, column_name: Proc.new { |model| model.active? ? :active_tasks_count : nil }
  counter_culture :user, column_name: Proc.new { |model| model.completed? ? :completed_tasks_count : nil }

  has_many :categories_tasks
  has_many :categories, through: :categories_tasks

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :description, presence: true

  def completed?
    !!completed_at
  end

  def active?
    !completed?
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
