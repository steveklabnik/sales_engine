require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice_item'

class SalesEngine::InvoiceItemTest < MiniTest::Unit::TestCase
  def test_it_exists
    invoice_item = SalesEngine::InvoiceItem.new
    assert_kind_of(SalesEngine::InvoiceItem, invoice_item)
  end

  def test_it_is_initialized_from_a_csv_of_data
    data = "data/invoice_items.csv"
    invoice_items = SalesEngine::InvoiceItem.new(data).invoice_items
    assert_equal(21687, invoice_items.count)
  end
end
