require 'csv'

class Inventory < ApplicationRecord
    belongs_to :item

    # == VALIDATIONS
    validates :sku, presence: true, uniqueness: { case_sensitive: false }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :par_level, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :sold, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

    # Export inventory as csv
    def self.to_csv
        csv_attributes = ["sku", "title", "quantity", "price", "unit_cost"]
        CSV.generate(headers: true) do |csv|
            csv << csv_attributes
            all.find_each do |inventory|
                csv << csv_attributes.map do |attribute|
                    inventory.send(attribute)
                end
            end
        end
    end

    private

    def title
        item.title
    end

    def price
        item.price
    end

    def unit_cost
        item.unit_cost
    end
end
