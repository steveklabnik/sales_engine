require './lib/sales_engine/item_builder'
require './lib/sales_engine/finder'
require 'bigdecimal'

module SalesEngine

  class Item

    extend SalesEngine::Finder
    attr_reader :id, :name, :description, :unit_price, :merchant_id

    def initialize(data="")
      @id = data[:id].to_i
      @name = data[:name]
      @description = data[:description]
      @unit_price = BigDecimal.new(data[:unit_price])
      @merchant_id = data[:merchant_id].to_i
    end

    def self.create(item)
      @items ||= []
      @items << new(item)
    end

    def self.all
      @items
    end

    def self.find_by_name(value)
      find_by_("name", value)
    end

    def self.find_all_by_name(value)
      find_all_by_("name", value)
    end

    def self.find_by_description(value)
      find_by_("description", value)
    end

    def self.find_all_by_description(value)
      find_all_by_("description", value)
    end

    def self.find_by_unit_price(value)
      find_by_("unit_price", value)
    end

    def self.find_all_by_unit_price(value)
      find_all_by_("unit_price", value)
    end

    def self.find_by_merchant_id(value)
      find_by_("merchant_id", value)
    end

    def self.find_all_by_merchant_id(value)
      find_all_by_("merchant_id", value)
    end

  end
end

