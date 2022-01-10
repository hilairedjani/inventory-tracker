# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create some types
types_attrs = [
    {title: "Clothing"}, 
    {title: "Food"},
    {title: "Stationery"}, 
]

types = Type.create(types_attrs)

items_attrs = [
    {title: "Product one", description: "Product one description", 
    },
    {title: "Product two", description: "Product two description", 
        inventory_attributes: {quantity: 10,sku: "KHYS", track_quantity: false}
    },
    {title: "Product three", description: "Product three description", 
        inventory_attributes: {quantity: 10,sku: "KHYT", track_quantity: true}
    },

]

Item.create(items_attrs)