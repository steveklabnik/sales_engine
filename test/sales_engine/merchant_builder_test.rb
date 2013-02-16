require './test/sales_engine/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant_builder'

class SalesEngine::MerchantBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/merchants_test.csv"
    merchants = SalesEngine::MerchantBuilder.from_csv(data)
    assert_equal(CSV, merchants.class)
  end
end
