require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

require_relative "warehouse_mgr_setup.rb"
require_relative "location.rb"
require_relative "category.rb"
require_relative "product.rb"


puts "WELCOME TO THE WAREHOUSE MANAGEMENT SYSTEM! \n\n What would you like to do? \n\n"
puts "1 - Pull up product records for a location \n 2 - Pull up product record \n"
puts "3 - Edit product information \n 4 - Transfer product \n 5 - Delete a product"
## need to add in delete a location (if location has no stock) ## 
selection = gets.chomp.to_i

valid_answers = [1, 2, 3, 4, 5]

until valid_answers.include?(selection)
  puts "I'm sorry that is not a valid selection. What would you like to do? \n\n"
  puts "1 - Pull up product records for a location \n 2 - Pull up product record \n"
  puts "3 - Edit product information \n 4 - Transfer product \n 5 - Delete a product"
  selection = gets.chomp.to_i
end
  
if selection == 1 # Pull up all records for a location
  puts "Please enter the location's id:"
  id = gets.chomp.to_i
  
  Product.fetch_by("location_id" => id)
  
  
  
elsif selection == 2 # Pull up a product record
  puts "Please enter the id or name of the product:"
  search_query = gets.chomp
  
  if Integer(search_query)
    Product.find("products", search_query)
  else
    Product.fetch_by("description" => search_query)
  end
  
elsif selection == 3 # Edit product information 
  
elsif selection == 4 # Transfer product
  
elsif selection == 5 # Delete a product
  puts "Please enter the id of the product you would like to delete:"
  id = gets.chomp.to_i
  
  Product.delete("locations", id)
end
  