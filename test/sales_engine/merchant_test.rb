require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant'

class SalesEngine::MerchantTest < MiniTest::Unit::TestCase
  def test_it_exists
    merchant = SalesEngine::Merchant.new
    assert_kind_of(SalesEngine::Merchant, merchant)
  end
end
