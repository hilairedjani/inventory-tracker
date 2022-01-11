class Item < ApplicationRecord

    # == Associations
    has_one :inventory, dependent: :destroy
    has_one :type


    # == Validations
    validates :title, presence: {message: "must be provided"}
    validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :unit_cost, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :compare_at_price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

    accepts_nested_attributes_for :inventory

    # == ENUMS
    enum status: %i[active inactive deleted]

end
