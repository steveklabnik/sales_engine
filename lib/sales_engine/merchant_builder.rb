require 'csv'
require './lib/sales_engine/merchant.rb'

module SalesEngine
  class MerchantBuilder

    DEFAULT_CSV = "data/merchants.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @csv = CSV.open(csv, :headers => true, :header_converters => :symbol)
    end

    def self.cycle_rows
      @csv.each do |row|
        SalesEngine::Merchant.create(row)
      end
    end

  end
end
