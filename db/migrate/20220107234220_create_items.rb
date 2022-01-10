class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.integer :unit_cost
      t.integer :compare_at_price
      t.text :description
      t.text :tags
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
