require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice_item_builder'

class SalesEngine::MerchantBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/invoice_items_test.csv"
    invoice_items = SalesEngine::InvoiceItemBuilder.from_csv(data)
    assert_equal(CSV, invoice_item.class)
  end
end
