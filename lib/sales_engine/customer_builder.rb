require 'csv'
require './lib/sales_engine/customer.rb'

module SalesEngine
  class CustomerBuilder

    DEFAULT_CSV = "data/merchants.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::Customer.create(row)
      end
    end

  end
end