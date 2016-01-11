class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         # no need to have this now
         #:recoverable, :rememberable, :trackable, :validatable

  # validations
  # not 100% regexp
  validates :email, presence: true, format: { with: /\A[a-z0-9\.-_]+@[a-z0-9]+(-?[a-zA-Z0-9])*(\.[a-z](-?[a-z0-9])*)+\Z/ }
  validates :phone, format: { with: /\A\d{6,}\Z/ }, allow_blank: true

  validates :name, length: {minimum: 2, maximum: 32}, allow_blank: true
  validates :surname, length: {minimum: 2, maximum: 32}, allow_blank: true
end
