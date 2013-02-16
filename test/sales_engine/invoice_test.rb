require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice'

class SalesEngine::InvoiceTest < MiniTest::Unit::TestCase

  def setup
    @csv = CSV.open("test/support/invoice_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exists
    @first_record = @csv.first
    invoice = SalesEngine::Invoice.new(@first_record)
    assert_kind_of(SalesEngine::Invoice, invoice)
    assert_equal(1, invoice.customer_id)
  end

  def test_it_creates_array_of_invoice_objects
    count = 1
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    assert_operator(5, :<=, SalesEngine::Invoice.all.size)
  end

  def test_random_returns_random_invoice
    @csv = CSV.open("test/support/invoice_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    rand1 = SalesEngine::Invoice.random
    rand2 = SalesEngine::Invoice.random
    refute_same(rand1.merchant_id, rand2.merchant_id)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    invoice = SalesEngine::Invoice.find_by_id(1)
    assert_equal(invoice.merchant_id, 26)
  end
  
  def test_it_can_find_by_customer_id
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    invoice = SalesEngine::Invoice.find_by_customer_id(7)
    assert_equal(invoice.merchant_id, 33)
  end
  
  def test_it_can_find_by_merchant_id
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    invoice = SalesEngine::Invoice.find_by_merchant_id(33)
    assert_equal(invoice.customer_id, 7)
  end
  
  def test_it_can_find_by_status
    @csv.each do |row|
      SalesEngine::Invoice.create(row)
    end
    invoice = SalesEngine::Invoice.find_by_status("canceled")
    assert_equal(invoice.merchant_id, 75)
  end
  
end
    
