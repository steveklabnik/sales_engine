require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/item'

class SalesEngine::ItemTest < MiniTest::Unit::TestCase
  def test_it_exists
    item = SalesEngine::Item.new
    assert_kind_of(SalesEngine::Item, item)
  end
end