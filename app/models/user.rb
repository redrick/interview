class User < ActiveRecord::Base

  # Scopes

  # Associations

  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true

  # Callbacks


end
