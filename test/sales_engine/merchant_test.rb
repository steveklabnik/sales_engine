require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant'

class SalesEngine::MerchantTest < MiniTest::Unit::TestCase
  def test_it_exists
    merchant = SalesEngine::Merchant.new
    assert_kind_of(SalesEngine::Merchant, merchant)
  end

  def test_it_is_initialized_from_a_csv_of_data
    data = "data/merchants_test.csv"
    merchants = SalesEngine::Merchant.new(data).merchants
    assert_equal(3, merchants.count)
  end
end
