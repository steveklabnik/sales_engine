require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/customer'

class SalesEngine::CustomerTest < MiniTest::Unit::TestCase
  def test_it_exitsts
    customer = SalesEngine::Customer.new
    assert_kind_of(SalesEngine::Customer, customer)
  end
end