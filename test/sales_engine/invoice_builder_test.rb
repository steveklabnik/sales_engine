require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice_builder'

class SalesEngine::InvoiceBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/invoice_test.csv"
    invoices = SalesEngine::InvoiceBuilder.from_csv(data)
    assert_equal(CSV, invoices.class)
  end
end