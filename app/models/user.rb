class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  scope :admins, -> { where(type: 'Admin') }
  scope :managers, -> { where(type: 'Manager') }


  def self.types
    %w(Admin Manager)
  end
end
