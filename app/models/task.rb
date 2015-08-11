class Task < ActiveRecord::Base
  scope :done, -> { where(done: true) }
  scope :undone, -> { where(done: false) }
  
  belongs_to :user
end
