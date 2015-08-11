class Category < ActiveRecord::Base
  has_many :tasks, dependent: :nullify
  
  def to_s
    "#{name}"
  end
end
