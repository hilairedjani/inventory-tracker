class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :quantity, default: 0
      t.integer :par_level
      t.integer :sold, default: 0
      t.string :sku
      t.string :barcode
      t.boolean :track_quantity, default: 1
      t.integer :status, default: 0

      t.timestamps

      t.references :item, index: true
    end
  end
end
