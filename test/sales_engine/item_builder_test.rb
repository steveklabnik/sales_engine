require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/item_builder'

class SalesEngine::ItemBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/items_test.csv"
    items = SalesEngine::ItemBuilder.from_csv(data)
    assert_equal(CSV, items.class)
  end
end
