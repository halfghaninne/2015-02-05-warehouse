require 'pry'
require 'minitest/autorun'

require "sqlite3"

DATABASE = SQLite3::Database.new("warehouse_test.db")

require_relative 'product.rb'
require_relative 'location.rb'
require_relative 'category.rb'

class WarehouseTest < Minitest::Test
  
  def setup
    DATABASE.execute("DELETE FROM products")
    DATABASE.execute("DELETE FROM locations")
    DATABASE.execute("DELETE FROM categories")
  end
  
  def test_location_creation
    location = Location.new({"city" => "Omaha"})
    location.insert   
    results = DATABASE.execute("SELECT city FROM locations WHERE id = #{location.id}")
    
    added_location = results[0]
    
    assert_equal(1, results.length)
    assert_equal("Omaha", added_location["city"])
  end
  
  def test_list_all_locations
    DATABASE.execute("DELETE FROM locations")
    
    l1 = Location.new({"city" => "Omaha"})
    l2 = Location.new({"city" => "Lincoln"})
    l3 = Location.new({"city" => "Kearney"})
    l1.insert
    l2.insert
    l3.insert
    assert_equal(3, Location.all.length)
  end
    
  def test_list_all_categories
    DATABASE.execute("DELETE FROM categories")
    
    l1 = Category.new({"name" => "Movie"})
    l2 = Category.new({"name" => "Book"})
    l1.insert
    l2.insert
    assert_equal(2, Category.all.length)
  end
  
  def test_category_creation
    category = Category.new({"name" => "Movie"})
    category.insert   
    results = DATABASE.execute("SELECT name FROM categories WHERE id = #{category.id}")
    
    added_category = results[0]
    
    assert_equal(1, results.length)
    assert_equal("Movie", added_category["name"])
  end
end