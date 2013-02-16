require './test/sales_engine/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/transaction'

class SalesEngine::TransactionTest < MiniTest::Unit::TestCase

  def setup
    @csv = CSV.open("test/support/transactions_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exists
    @first_record = @csv.first 
    transaction = SalesEngine::Transaction.new(@first_record)
    assert_kind_of(SalesEngine::Transaction, transaction)
    assert_equal(4654405418249632, transaction.credit_card_number)
  end

  def test_it_creates_array_of_transaction_objects
    count = 1
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    assert_operator(4, :<=, SalesEngine::Transaction.all.size)
  end

  def test_random_returns_random_transaction
    @csv = CSV.open("test/support/transactions_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    rand1 = SalesEngine::Transaction.random 
    rand2 = SalesEngine::Transaction.random 
    refute_same(rand1.credit_card_number, rand2.credit_card_number)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    transaction = SalesEngine::Transaction.find_by_id(1)
    assert_equal(transaction.invoice_id, 1)
  end

  def test_it_can_find_by_invoice_id
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    transaction = SalesEngine::Transaction.find_by_invoice_id(1)
    assert_equal(transaction.id, 1)
  end

  def test_find_by_only_returns_one_record
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    transaction = SalesEngine::Transaction.find_by_invoice_id(1)
    assert_equal(transaction.id, 1)
  end

  def test_find_all_by_returns_multiple_records
    @csv.each do |row|
      SalesEngine::Transaction.create(row)
    end
    transactions = SalesEngine::Transaction.find_all_by_invoice_id(1)
    assert_operator(1, :<=, transactions.size)
  end

end
