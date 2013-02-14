require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/item'

class SalesEngine::ItemTest < MiniTest::Unit::TestCase
  def test_it_exists
    item = SalesEngine::Item.new
    assert_kind_of(SalesEngine::Item, item)
  end

  def test_it_is_initialized_from_a_csv_of_data
    data = "data/items.csv"
    items = SalesEngine::Item.new(data).items
    assert_equal(2483, items.count)
  end
end