require 'csv'

module SalesEngine

  class Merchant

    attr_accessor :merchants

    DEFAULT_CSV = "data/merchants.csv"

    def initialize(data = DEFAULT_CSV)
      @data = CSV.open(data, :headers => true, :header_converters => :symbol)
      create_merchants
    end

    def create_merchants
      @merchants = @data.collect do |row|
        merchant = {
          :id => row[:id],
          :name => row[:name],
          :created_at => row[:created_at],
          :updated_at => row[:updated_at]
        }
      end
    end

  end
end
