class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         # no need to have this now
         #:recoverable, :rememberable, :trackable, :validatable

  # relations
  has_many :tasks, :dependent => :destroy
  has_many :categories, :dependent => :destroy

  scope :ordered, -> { order([:surname, :name]) }

  # validations
  # not 100% regexp
  validates :email, presence: true, format: { with: /\A[a-z0-9\.-_]+@[a-z0-9]+(-?[a-zA-Z0-9])*(\.[a-z](-?[a-z0-9])*)+\Z/ }
  validates :email, uniqueness: true
  validates :phone, format: { with: /\A\d{6,}\Z/ }, allow_blank: true

  validates :name, length: {minimum: 2, maximum: 32}, allow_blank: true
  validates :surname, length: {minimum: 2, maximum: 32}, allow_blank: true

  def admin?
    self.is_a?(Admin)
  end

  # get all descendant classes
  def self.user_types
    descendants.map(&:name)
  end

  def full_name
    full_name = [surname.presence, name.presence].compact.join(', ')
    full_name = 'N/A' if full_name.blank?
    full_name
  end

end
