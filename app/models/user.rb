class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  EMAIL_FORMAT = /\A\S+@.+\.\S+\z/
  PHONE_FORMAT = /(((\+|00)\d{3} ?\d{3})|(\d{4})? ?\d{3} ?\d{3})/

  scope :admins,   -> { where(type: 'Admin') }
  scope :managers, -> { where(type: 'Manager') }

  has_many :tasks, dependent: :destroy

  # Do not validate so default signup works
  # validates :name,         presence: true
  # validates :surname,      presence: true
  validates :email,        presence: true, format: { with: EMAIL_FORMAT }
  validates :phone,                        format: { with: PHONE_FORMAT }, allow_blank: true

  def self.types
    %w(Admin Manager)
  end

  def full_name
    "#{name} #{surname}"
  end

end
