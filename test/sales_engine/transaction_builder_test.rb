require './test/sales_engine/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/transaction_builder'

class SalesEngine::TransactionBuilderTest < MiniTest::Unit::TestCase
  def test_it_is_initialized_from_a_csv
    data = "test/support/transactions_test.csv"
    transactions = SalesEngine::TransactionBuilder.from_csv(data)
    assert_equal(CSV, transactions.class)
  end
end
