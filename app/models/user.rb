class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Scopes

  # Associations

  # Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true

  # Callbacks


end
