require './lib/sales_engine/transaction_builder'
require './lib/sales_engine/finder'

module SalesEngine

  class Invoice

    extend SalesEngine::Finder 
    attr_reader :id, :customer_id, :merchant_id, :status

    def initialize(data="")
      @id = data[:id].to_i
      @customer_id = data[:customer_id].to_i
      @merchant_id = data[:merchant_id].to_i
      @status = data[:status]
    end

    def self.create(invoice)
      @invoices ||= []
      @invoices << new(invoice)
    end

    def self.all
      @invoices
    end

    def self.find_by_customer_id(value)
      find_by_("customer_id", value)
    end

    def self.find_all_by_customer_id(value)
      find_all_by("customer_id", value)
    end

    def self.find_by_merchant_id(value)
      find_by_("merchant_id", value)
    end

    def self.find_all_by_merchant_id(value)
      find_all_by("merchant_id", value)
    end

    def self.find_by_status(value)
      find_by_("status", value)
    end

    def self.find_all_by_status(value)
      find_all_by("status", value)
    end
    
  end
end
