require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/transaction'

class SalesEngine::TransactionTest < MiniTest::Unit::TestCase
  def test_it_exists
    transaction = SalesEngine::Transaction.new
    assert_kind_of(SalesEngine::Transaction, transaction)
  end
end