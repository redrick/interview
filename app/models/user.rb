class User < ActiveRecord::Base

  scope :admins,   -> { where(type: 'Admin') }
  scope :managers, -> { where(type: 'Manager') }

  has_many :tasks, dependent: :destroy

  def self.types
    %w(Admin Manager)
  end

  def full_name
    "#{name} #{surname}"
  end

end
