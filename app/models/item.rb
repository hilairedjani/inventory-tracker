class Item < ApplicationRecord

    # == Associations
    has_one :inventory, dependent: :destroy
    has_one :type


    # == Validations
    validates :title, presence: {message: "must be provided"}

    accepts_nested_attributes_for :inventory

    # == ENUMS
    enum status: %i[active inactive deleted]

end
