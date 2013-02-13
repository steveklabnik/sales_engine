module SalesEngine
  class MerchantBuilder

    attr_accessor :merchants

    DEFAULT_CSV = "data/merchants.csv"

    def self.from_csv(csv=DEFAULT_CSV)
      @data = CSV.open(csv, :headers => true, :header_converters => :symbol)
      @data.collect do |row|
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
