require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

require_relative "warehouse_mgr_setup.rb"
require_relative "location.rb"
require_relative "category.rb"
require_relative "product.rb"

binding.pry