require 'csv'
require './lib/sales_engine/invoice.rb'

module SalesEngine
  class InvoiceBuilder

    DEFAULT_CSV = "data/invoices.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::Invoice.create(row)
      end
    end

  end
end