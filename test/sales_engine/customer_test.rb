require 'minitest/autorun'
require 'minitest/emoji'

require './lib/sales_engine/customer'

class SalesEngine::CustomerTest < MiniTest::Unit::TestCase

  def setup
    @csv = CSV.open("test/support/customers_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exitsts
    @first_record = @csv.first
    customer = SalesEngine::Customer.new(@first_record)
    assert_kind_of(SalesEngine::Customer, customer)
    assert_equal("Joey", customer.first_name)
  end

  def test_it_creates_array_of_customer_objects
    count = 1
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    assert_operator(5, :<=, SalesEngine::Customer.all.size)
  end

  def test_random_returns_random_customer
    @csv = CSV.open("test/support/customers_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    rand1 = SalesEngine::Customer.random 
    rand2 = SalesEngine::Customer.random
    refute_same(rand1.first_name, rand2.first_name)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    customer = SalesEngine::Customer.find_by_id(1)
    assert_equal(customer.first_name, "Joey")
  end

  def test_it_can_find_by_first_name
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    customer = SalesEngine::Customer.find_by_first_name("Joey")
    assert_equal(customer.id, 1)
  end

  def test_find_by_only_returns_one_record
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    customer = SalesEngine::Customer.find_by_first_name("Joey")
    assert_equal(customer.id, 1)
  end

  def test_find_all_by_returns_multiple_records
    @csv.each do |row|
      SalesEngine::Customer.create(row)
    end
    customers = SalesEngine::Customer.find_all_by_first_name("Joey")
    assert_operator(1, :<=, customers.size)
  end

end
