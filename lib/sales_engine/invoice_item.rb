require './lib/sales_engine/invoice_item_builder'
require './lib/sales_engine/finder'

module SalesEngine

  class InvoiceItem

    extend SalesEngine::Finder
    attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

    def initialize(data="")
      @id = data[:id].to_i
      @item_id = data[:item_id].to_i
      @invoice_id = data[:invoice_id].to_i
      @quantity = data[:quantity].to_i
      @unit_price = data[:unit_price].to_i
    end

    def self.create(invoice_item)
      @invoice_items ||= []
      @invoice_items << new(invoice_item)
    end

    def self.all
      @invoice_items
    end

    def self.find_by_item_id(value)
      find_by_("item_id", value)
    end

    def self.find_all_by_item_id(value)
      find_all_by_("item_id", value)
    end

  end
end
