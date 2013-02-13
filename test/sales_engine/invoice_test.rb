require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/invoice'

class SalesEngine::InvoicesTest < MiniTest::Unit::TestCase
  def test_it_exists
    invoice = SalesEngine::Invoice.new
    assert_kind_of(SalesEngine::Invoice, invoice)
  end
end
    