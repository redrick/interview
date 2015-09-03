class Task < ActiveRecord::Base

  include RankedModel
  ranks :order

  # Scopes
  default_scope { rank(:order) }

  # Associations

  # Validations
  validates :name, presence: true

  # Callbacks

end
