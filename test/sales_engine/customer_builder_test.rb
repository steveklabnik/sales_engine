require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/customer_builder'

class SalesEngine::CustomerBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/customers_test.csv"
    customers = SalesEngine::CustomerBuilder.from_csv(data)
    assert_equal(CSV, customers.class)
  end
end