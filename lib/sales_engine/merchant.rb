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

    def self.find_by_id(id)
      all.find
    end

  end
end
