class Category < ActiveRecord::Base

    # Scopes

    # Associations
    has_many :tasks

    # Validations
    validates :name, presence: true

    # Callbacks

end
