require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant'

class SalesEngine::MerchantTest < MiniTest::Unit::TestCase

  def setup
  end

  def test_it_exists
    merchant = SalesEngine::Merchant.new
    assert_kind_of(SalesEngine::Merchant, merchant)
  end

  #def test_it_builds_from_a_csv
  #  output = MerchantBuilder.from_csv("")
  #  assert_operator 5, :<=, output
  #end

  def teardown
  end
end
