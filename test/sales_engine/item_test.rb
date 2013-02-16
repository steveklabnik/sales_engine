require './test/sales_engine/test_helper'
require 'minitest/autorun'
require 'minitest/pride'

require './lib/sales_engine/item'

class SalesEngine::ItemTest < MiniTest::Unit::TestCase

  def setup
    @csv = CSV.open("test/support/items_test.csv", :headers => true, :header_converters => :symbol)
  end

  def test_it_exists
    @first_record = @csv.first
    item = SalesEngine::Item.new(@first_record)
    assert_kind_of(SalesEngine::Item, item)
    assert_equal("Item Qui Esse", item.name)
  end

  def test_it_creates_array_of_item_objects
    count = 1
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    assert_operator(5, :<=, SalesEngine::Item.all.size)
  end

  def test_random_returns_random_item
    @csv = CSV.open("test/support/items_test.csv", :headers => true, :header_converters => :symbol)
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    rand1 = SalesEngine::Item.random
    rand2 = SalesEngine::Item.random
    refute_equal(rand1.name, rand2.name)
  end

  def test_it_can_find_by_id
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_id(1)
    assert_equal(item.name, "Item Qui Esse")
  end

  def test_it_can_find_by_name
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_name("Item Qui Esse")
    assert_equal(item.id, 1)
  end

  def test_it_can_find_by_description
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_description("It's red and shiny and pretty")
    assert_equal(item.id, 1)
  end

  def test_it_can_find_by_unit_price
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_unit_price(BigDecimal.new(75107))
    assert_equal(item.id, 1)
  end

  def test_it_can_find_by_merchant_id
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_merchant_id(45)
    assert_equal(item.id, 1)
  end

  def test_find_by_only_returns_one_record
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    item = SalesEngine::Item.find_by_name("Item Qui Esse")
    assert_equal(item.id, 1)
  end

  def test_find_all_by_returns_multiple_records
    @csv.each do |row|
      SalesEngine::Item.create(row)
    end
    items = SalesEngine::Item.find_all_by_name("Item Qui Esse")
    assert_operator(1, :<=, items.size)
  end

end
