require './lib/sales_engine/merchant_builder'
require './lib/sales_engine/finder'

module SalesEngine

  class Merchant

    extend SalesEngine::Finder
    attr_reader :id, :name

    def initialize(data="")
      @id = data[:id]
      @name = data[:name]
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
