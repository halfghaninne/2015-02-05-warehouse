require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

class Product
  
  attr_reader :id
  attr_accessor :location_id, :cost, :quantity
  
  def initialize(options)
    @serial_number = options[:serial_number].to_i
    @name = options[:name]
    @description = options[:description]
    @quantity = options[:quantity].to_i
    @cost = options[:cost].to_i
    @location_id = options[:location_id].to_i
    @category_id = options[:category_id].to_i
    insert
  end
  
  private
  
  def insert
    DATABASE.execute("INSERT INTO products (serial_number, name, description, 
                      quantity, cost, location_id, category_id) 
                      VALUES (#{@serial_number}, '#{@name}', '#{@description}', 
                      #{@quantity}, #{@cost}, #{@location_id}, #{@category_id})")
    # At present, 0's are entered in for integer values that are not entered, need to change this to our default settings. Blank field left for empty text values.
    @id = DATABASE.last_insert_row_id
  end
  
end

