require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "should not save item without title" do
    item = Item.new
    assert_not item.save
  end

  test "should not save item with negative price" do
    item = Item.new(title: "Test title", price: -1)
    assert_not item.save
  end

  test "should not save item with negative unit cost" do
    item = Item.new(title: "Test title", unit_cost: -1)
    assert_not item.save
  end

  test "should not save item with negative compare at price" do
    item = Item.new(title: "Test title", compare_at_price: -1)
    assert_not item.save
  end
end
