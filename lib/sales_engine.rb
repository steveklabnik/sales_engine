$LOAD_PATH.unshift("./", './lib/')
require 'sales_engine/merchant_builder'
require 'sales_engine/merchant'

module SalesEngine
  def self.startup
    SalesEngine::MerchantBuilder.from_csv
    #SalesEngine::MerchantBuilder.from_csv("test/support/merchants_test.csv")
    SalesEngine::MerchantBuilder.cycle_rows
    SalesEngine::ItemBuilder.from_csv
    SalesEngine::ItemBuilder.cycle_rows
  end
end

SalesEngine.startup

i = SalesEngine::Item.find_by_id(1)
puts i.unit_price.class
