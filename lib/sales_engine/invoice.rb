require './lib/sales_engine/transaction_builder'
require './lib/sales_engine/finder'

module SalesEngine

  class Invoice

    extend SalesEngine::Finder 
    attr_reader :id, :customer_id

    def initialize(data="")
      @id = data[:id].to_i
      @customer_id = data[:customer_id]
    end

    def self.create(invoice)
      @invoices ||= []
      @invoices << new(invoice)
    end

    def self.all
      @transactions
    end

  end
end
