require 'csv'
require './lib/sales_engine/item.rb'

module SalesEngine
  class ItemBuilder

    DEFAULT_CSV = "data/item.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::Item.create(row)
      end
    end

  end
end
