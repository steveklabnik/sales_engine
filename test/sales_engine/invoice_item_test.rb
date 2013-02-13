require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice_item'

class SalesEngine::InvoiceItemTest < MiniTest::Unit::TestCase
  def test_it_exists
    invoice_item = SalesEngine::InvoiceItem.new
    assert_kind_of(SalesEngine::InvoiceItem, invoice_item)
  end
end