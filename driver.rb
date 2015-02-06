require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

require_relative 'warehouse_mgr_setup'
# require_relative 'location'
# require_relative 'category.rb'
# require_relative 'product.rb'

