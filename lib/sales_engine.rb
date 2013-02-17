$LOAD_PATH.unshift("./", './lib/')
require 'sales_engine/merchant_builder'
require 'sales_engine/merchant'
require 'sales_engine/item_builder'
require 'sales_engine/item'
require 'sales_engine/invoice_builder'
require 'sales_engine/invoice'

module SalesEngine
  def self.startup
    SalesEngine::MerchantBuilder.from_csv
    SalesEngine::MerchantBuilder.cycle_rows
    SalesEngine::ItemBuilder.from_csv
    SalesEngine::ItemBuilder.cycle_rows
    SalesEngine::InvoiceBuilder.from_csv
    SalesEngine::InvoiceBuilder.cycle_rows
  end
end

SalesEngine.startup

merchant = SalesEngine::Merchant.all.first

puts merchant.invoices.size


#items = SalesEngine::Merchant.items
#puts i.unit_price.class
