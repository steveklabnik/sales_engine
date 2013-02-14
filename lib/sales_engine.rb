$LOAD_PATH.unshift("./", './lib/')
require 'sales_engine/merchant_builder'
require 'sales_engine/merchant'

module SalesEngine
  def self.startup
    SalesEngine::MerchantBuilder.from_csv
    SalesEngine::MerchantBuilder.cycle_rows
  end
end

SalesEngine.startup

merchants = SalesEngine::Merchant.all

merchants.each do |merchant|
  puts "#{merchant.id} = #{merchant.name}"
end
