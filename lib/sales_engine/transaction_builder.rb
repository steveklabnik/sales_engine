require 'csv'
require './lib/sales_engine/transaction.rb'

module SalesEngine
  class TransactionBuilder

    DEFAULT_CSV = "data/transactions.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::Transaction.create(row)
      end
    end

  end
end