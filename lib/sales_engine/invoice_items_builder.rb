require 'csv'
require './lib/sales_engine/invoice_item.rb'

module SalesEngine
  class InvoiceItemBuilder

    DEFAULT_CSV = "data/invoice_items.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::InvoiceItem.create(row)
      end
    end

  end
end
