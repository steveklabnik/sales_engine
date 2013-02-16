require './lib/sales_engine/customer_builder'
require './lib/sales_engine/finder'

module SalesEngine
  
  class Customer

    extend SalesEngine::Finder 
    attr_reader :id, :first_name, :last_name

    def initialize(data="")
      @id = data[:id].to_i
      @first_name = data[:first_name]
      @last_name = data[:last_name]
    end

    def self.create(customer)
      @customers ||= []
      @customers << new(customer)
    end

    def self.all 
      @customers
    end

    def self.find_by_first_name(value)
      find_by_("first_name", value)
    end

    def self.find_all_by_first_name(value)
      find_all_by_("first_name", value)
    end

    def self.find_by_last_name(value)
      find_by_("last_name", value)
    end

    def self.find_all_by_last_name(value)
      find_all_by_("last_name", value)
    end
    
  end
end
