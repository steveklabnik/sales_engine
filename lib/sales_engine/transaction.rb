require './lib/sales_engine/merchant_builder'
require './lib/sales_engine/finder'

module SalesEngine

  class Transaction

    extend SalesEngine::Finder
    attr_reader :id, :credit_card_number

    def initialize(data="")
      @id = data[:id]
      @credit_card_number = data[:credit_card_number]
    end

    def self.create(transaction)
      @transactions ||= []
      @transactions << new(transaction)
    end

    def self.all
      @transactions
    end

  end
end
