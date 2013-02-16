require './test/sales_engine/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/merchant'
require './lib/sales_engine/item'

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
    @csv = CSV.open("data/merchants.csv", :headers => true, :header_converters => :symbol)
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

  def test_it_can_find_by_name
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    merchant = SalesEngine::Merchant.find_by_name("Schroeder-Jerde")
    assert_equal(merchant.id, 1)
  end

  def test_find_by_name_only_returns_one_record
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    merchant = SalesEngine::Merchant.find_by_name("Schroeder-Jerde")
    assert_equal(merchant.id, 1)
  end

  def test_find_all_by_name_returns_multiple_records
    @csv.each do |row|
      SalesEngine::Merchant.create(row)
    end
    merchants = SalesEngine::Merchant.find_all_by_name("Schroeder-Jerde")
    assert_operator(1, :<=, merchants.size)
  end

# Integration Tests

  def test_it_returns_a_collection_of_associated_items
    first_record = @csv.first
    merchant = SalesEngine::Merchant.new(first_record)

    item_csv = SalesEngine::Item.from_csv
    item_csv.each do |row|
      SalesEngine::Item.create(row)
    end

    merchant.items.each do |i|
      puts i.name
    end
    #assert_equal(15, merchant.items.size)
  end

  #def test_it_returns_an_associated_collection_of_associated_invoices
  #  first_record = @csv.first
  #  merchant = SalesEngine::Merchant.new(first_record)

  #  invoice_csv = CSV.open("data/invoices.csv", :headers => true, :header_converters => :symbol)
  #  invoice_csv.each do |row|
  #    SalesEngine::Item.create(row)
  #  end
  #  assert_equal(15, merchant.invoices.size)
  #end

end
