$LOAD_PATH.unshift("./", './lib/')
require 'sales_engine/merchant_builder'
require 'sales_engine/merchant'
require 'sales_engine/item_builder'
require 'sales_engine/item'
require 'sales_engine/invoice_builder'
require 'sales_engine/invoice'
require 'sales_engine/invoice_item_builder'
require 'sales_engine/invoice_item'

module SalesEngine
  def self.startup
    SalesEngine::MerchantBuilder.from_csv
    SalesEngine::MerchantBuilder.cycle_rows
    SalesEngine::ItemBuilder.from_csv
    SalesEngine::ItemBuilder.cycle_rows
    SalesEngine::InvoiceBuilder.from_csv
    SalesEngine::InvoiceBuilder.cycle_rows
    SalesEngine::InvoiceItemBuilder.from_csv("./test/support/invoice_item_test.csv")
    SalesEngine::InvoiceItemBuilder.cycle_rows
  end
end

SalesEngine.startup

invoice_items = SalesEngine::InvoiceItem.find_all_by_item_id(539)

puts invoice_items.size


#items = SalesEngine::Merchant.items
#puts i.unit_price.class
