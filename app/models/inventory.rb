require 'csv'

class Inventory < ApplicationRecord
    belongs_to :item

    # == VALIDATIONS
    validates :sku, presence: true, uniqueness: { case_sensitive: false }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :par_level, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
    validates :sold, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

    # == Delegations
    delegate :title, :price, :unit_cost, :description, to: :item

    # Export inventory as csv
    def self.to_csv
        csv_attributes = ["sku", "barcode", "title", "quantity", "price", "unit_cost", "description"]
        CSV.generate(headers: true) do |csv|
            csv << csv_attributes
            all.find_each do |inventory|
                csv << csv_attributes.map do |attribute|
                    inventory.send(attribute)
                end
            end
        end
    end
end
