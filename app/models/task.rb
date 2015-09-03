class Task < ActiveRecord::Base

  include RankedModel
  ranks :order

  # Scopes
  default_scope { rank(:order) }
  scope :undone, -> { where(done: false) }

  # Associations
  belongs_to :category

  # Validations
  validates :name, presence: true

  # Callbacks

end
