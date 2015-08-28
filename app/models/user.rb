class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  before_create :set_default_type, if: proc { |user| user.type.nil? }

  validates :first_name, :last_name, presence: true, length: { minimum: 3 }

  def admin?
    false
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def role
    fails 'Method is not implemented'
  end

  private

  # I know that is ugly but at the moment
  # I cannot find a better/easier solution
  # to integrate STI with devise
  # I tried self.becomes!(UserManager)
  # but didn't work
  def set_default_type
    self.type = 'UserManager'
  end
end
