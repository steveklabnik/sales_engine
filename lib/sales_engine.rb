$LOAD_PATH.unshift("./", './lib/')
require 'sales_engine/merchant_builder'
require 'sales_engine/merchant'

module SalesEngine
  def self.startup
    #SalesEngine::MerchantBuilder.from_csv
    SalesEngine::MerchantBuilder.from_csv("test/support/merchants_test.csv")
    SalesEngine::MerchantBuilder.cycle_rows
  end
end

SalesEngine.startup

a = SalesEngine::Merchant.find_all_by_("name", "schroeder-jerde")

a.each {|m| puts "#{m.name} = #{m.id}" }

#merchants.each do |merchant|
#  puts "#{merchant.id} = #{merchant.name}"
#end
