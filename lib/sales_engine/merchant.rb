require './lib/sales_engine/merchant_builder'
require './lib/sales_engine/finder'
require './lib/sales_engine/item'

module SalesEngine

  class Merchant

    extend SalesEngine::Finder
    attr_reader :id, :name

    def initialize(data="")
      @id = data[:id].to_i
      @name = data[:name]
    end

    def items
      SalesEngine::Item.find_all_by_("merchant_id", @id)
    end

    def self.create(merchant)
      @merchants ||= []
      @merchants << new(merchant)
    end

    def self.all
      @merchants
    end

    def self.find_by_name(value)
      find_by_("name", value)
    end

    def self.find_all_by_name(value)
      find_all_by_("name", value)
    end

  end
end
