class Task < ActiveRecord::Base

  belongs_to :user

  validates :task, presence: true

  # we don't like default_scopes
  scope :ordered, -> { order('created_at desc') }

  # simple alias
  def done?
    done_at?
  end

  def toggle_done
    self.done_at = (done?) ? nil : Time.now
    save
  end

end
