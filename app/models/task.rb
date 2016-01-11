class Task < ActiveRecord::Base

  belongs_to :user

  validates :task, presence: true

  # we don't like default_scopes, sort primarily by our sort_order then created_at
  scope :ordered, -> { order('sort_order asc, created_at desc') }
  scope :unfinished, -> { where(done_at: nil) }

  # simple alias
  def done?
    done_at?
  end

  def toggle_done
    self.done_at = (done?) ? nil : Time.now
    save
  end

end
