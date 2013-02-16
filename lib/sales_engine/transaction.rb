require './lib/sales_engine/merchant_builder'
require './lib/sales_engine/finder'
require './lib/sales_engine/invoice'

module SalesEngine

  class Transaction

    extend SalesEngine::Finder
    attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result

    def initialize(data="")
      @id = data[:id].to_i
      @invoice_id = data[:invoice_id].to_i
      @credit_card_number = data[:credit_card_number].to_i
      @credit_card_expiration_date = data[:credit_card_expiration_date].to_i
      @result = data[:result]
    end

    def self.create(transaction)
      @transactions ||= []
      @transactions << new(transaction)
    end

    def self.all
      @transactions
    end

    def self.find_by_invoice_id(value)
      find_by_("invoice_id", value)
    end

    def self.find_all_by_invoice_id(value)
      find_all_by_("invoice_id", value)
    end

    def self.find_by_credit_card_number(value)
      find_by_("credit_card_number", value)
    end

    def self.find_all_by_credit_card_number(value)
      find_all_by_("credit_card_number", value)
    end

    def self.find_by_credit_card_expiration_date(value)
      find_by_("credit_card_expiration_date", value)
    end

    def self.find_all_by_credit_card_expiration_date(value)
      find_all_by_("credit_card_expiration_date", value)
    end

    def self.find_by_result(value)
      find_by_("result", value)
    end

    def self.find_all_by_result(value)
      find_all_by_("result", value)
    end
    
  end
end
