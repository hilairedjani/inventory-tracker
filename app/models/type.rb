class Type < ApplicationRecord

    #== ASSOCIATIONS
    has_many :items

    # == Validations
    validates :title, presence: true, uniqueness: { case_sensitive: false }
end
