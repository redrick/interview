class Category < ActiveRecord::Base

  has_many :tasks
  belongs_to :user

  validates :name, presence: true

  scope :ordered, -> { order(:name) }
end
