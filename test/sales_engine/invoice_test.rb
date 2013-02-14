require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice'

class SalesEngine::InvoicesTest < MiniTest::Unit::TestCase
  def test_it_exists
    invoice = SalesEngine::Invoice.new
    assert_kind_of(SalesEngine::Invoice, invoice)
  end

  def test_it_is_initialized_from_a_csv_of_data
    data = "data/invoices.csv"
    invoices = SalesEngine::Invoice.new(data).invoices
    assert_equal(4843, invoices.count)
  end
end
    