require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice_item'

class SalesEngine::InvoiceItemTest < MiniTest::Unit::

  def setup
    @csv = CSV.open("test/support/invoice_items_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exists
    @first_record = @csv.first
    invoice_item = SalesEngine::InvoiceItem.new
    assert_kind_of(SalesEngine::InvoiceItem, invoice_item)
    assert_equal(539, invoice_item.item_id)
  end

  def test_it_creates_array_of_invoice_item_objects
    count = 1
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    assert_operator(5, :<=, SalesEngine::InvoiceItem.all.size)
  end

  def test_random_returns_random_invoice_item
    @csv = CSV.open("test/support/invoice_items_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    rand1 = SalesEngine::InvoiceItem.random
    rand2 = SalesEngine::InvoiceItem.random
    refute_equal(rand1.item_id, rand2.item_id)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    invoice_item = SalesEngine::InvoiceItem.find_by_id(1)
    assert_equal(invoice_item.item_id, 539)
  end

  def test_it_can_find_by_item_id
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    invoice_item = SalesEngine::InvoiceItem.find_by_item_id(539)
    assert_equal(invoice_item.id, 1)
  end

  def test_find_by_only_returns_one_record
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    invoice_item = SalesEngine::InvoiceItem.find_by_item_id(539)
    assert_equal(invoice_item.id, 1)
  end

  def test_find_all_by_returns_multiple_records
    @csv.each do |row|
      SalesEngine::InvoiceItem.create(row)
    end
    invoice_items = SalesEngine::InvoiceItem.find_all_by_item_id(539)
    assert_operator(5, :<=, invoice_items.size)
  end
  
end
