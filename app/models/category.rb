class Category < ActiveRecord::Base

  has_many :categories_tasks, dependent: :destroy
  has_many :tasks, through: :categories_tasks

end
