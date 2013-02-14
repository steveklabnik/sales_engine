require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant'

class SalesEngine::MerchantTest < MiniTest::Unit::TestCase

  def setup
    @csv = CSV.open("test/support/merchants_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exists
    @first_record = @csv.first
    merchant = SalesEngine::Merchant.new(@first_record)
    assert_kind_of(SalesEngine::Merchant, merchant)
    assert_equal("Schroeder-Jerde", merchant.name)
  end

  def test_it_creates_array_of_merchant_objects
    count = 1
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    assert_operator(3, :<=, SalesEngine::Merchant.all.size)
  end

  def test_random_returns_random_merchant
    @csv = CSV.open("test/support/merchants_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    rand1 = SalesEngine::Merchant.random
    rand2 = SalesEngine::Merchant.random
    refute_equal(rand1.name, rand2.name)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    merchant = SalesEngine::Merchant.find_by_id(1)
    assert_equal(merchant.name, "Schroeder-Jerde")
  end

end
