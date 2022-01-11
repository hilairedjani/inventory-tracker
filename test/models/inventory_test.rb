require "test_helper"

class InventoryTest < ActiveSupport::TestCase
  test "should not save inventory without item" do
    inventory = inventories(:one)
    inventory.item = nil
    assert_not inventory.save
  end

  test "should not save inventory without sku" do
    inventory = inventories(:one)
    inventory.sku = nil
    assert_not inventory.save
  end

  test "should not save inventory with duplicate sku" do
    inventory = Inventory.new(inventories(:one).attributes)
    assert_not inventory.save
  end

  test "should not save inventory with negative quantity" do
    inventory = inventories(:one)
    inventory.quantity = -1
    assert_not inventory.save
  end

  test "should not save inventory with negative par level" do
    inventory = inventories(:one)
    inventory.par_level = -1
    assert_not inventory.save
  end

  test "should not save inventory with negative sold" do
    inventory = inventories(:one)
    inventory.sold = -1
    assert_not inventory.save
  end
end
