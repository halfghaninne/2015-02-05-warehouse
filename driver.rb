require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

require_relative "warehouse_mgr_setup.rb"
require_relative "location.rb"
require_relative "category.rb"
require_relative "product.rb"


puts "Welcome to the warehouse management system! \n\n What would you like to do? \n\n"
puts "1 - Pull up product records for a location \n 2 - Pull up product record \n"
puts "3 - Edit product information \n 4 - Transfer product \n 5 - Delete a product"
selection = gets.chomp.to_i

valid_answers = [1, 2, 3, 4, 5]

until valid_answers.include?(selection)
  puts "I'm sorry that is not a valid selection. What would you like to do? \n\n"
  puts "1 - Pull up product records for a location \n 2 - Pull up product record \n"
  puts "3 - Edit product information \n 4 - Transfer product \n 5 - Delete a product"
  selection = gets.chomp.to_i
  
if selection == 1
elsif selection == 2
elsif selection == 3
elsif selection == 4
elsif selection == 5 
end

end
  



binding.pry