require './lib/sales_engine/merchant_builder'

module SalesEngine

  class Merchant
    attr_reader :id, :name

    def initialize(data)
      @id = data[:id]
      @name = data[:name]
    end

    def self.add_to_list(merchant)
      @merchants ||= []
      @merchants << merchant
    end

    def self.create(merchant)
      @merchants ||= []
      @merchants << new(merchant)
    end

    def self.all
      @merchants
    end

  end
end
