class Task < ActiveRecord::Base
  STATUS = %w(pending finished)
  default_scope { order(position: :asc) }

  belongs_to :category
  belongs_to :user

  has_many :assets, dependent: :destroy

  accepts_nested_attributes_for :assets, reject_if: Proc.new { |a| a['attachment'].nil? }

  validates :name, presence: true, length: { minimum: 3 }
  validates :category_id, presence: true

  def self.my_tasks(user_id)
    # avoid N+1 problem
    self.where("user_id=#{user_id}").includes(:assets)
  end

  def finished?
    self.status == 'finished'
  end
end
