require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/transaction'

class SalesEngine::TransactionTest < MiniTest::Unit::TestCase
  def test_it_exists
    transaction = SalesEngine::Transaction.new
    assert_kind_of(SalesEngine::Transaction, transaction)
  end

  def test_it_is_initialized_from_a_csv_of_data
    data = "data/transactions.csv"
    transactions = SalesEngine::Transaction.new(data).transactions
    assert_equal(5595, transactions.count)
  end
end