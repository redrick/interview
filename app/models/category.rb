class Category < ActiveRecord::Base
  has_many :tasks, dependent: :nullify
  
  validates :name, length: { maximum: 32 }, presence: true, uniqueness: true
  
  def to_s
    "#{name}"
  end
end
