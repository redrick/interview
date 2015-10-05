class User < ActiveRecord::Base

  scope :admins,   -> { where(type: 'Admin') }
  scope :managers, -> { where(type: 'Manager') }

  def self.types
    %w(Admin Manager)
  end

end
