require 'pry'
require 'sqlite3'

require_relative "warehouse_methods.rb"

# Class: Product
#
# Creates new product objects/records for products table in warehouse_mgr database
# 
# Attributes:
# + @id              - Integer: Primary key ##user shouldn't overwrite##
# + @serial_number   - Integer 
# + @description     - String:
# + @quantity        - Integer:
# + @cost            - Integer: ##CONSIDER CHANGING TO FLOAT/OTHER VALUE##
# + @location_id     - Integer: Foreign key ##RESTRICT VALUES##
# + @category_id     - Integer: Foreign key ##RESTRICT VALUES##
#
# Public Methods:
# ???
#
# Private Methods:
# + insert

class Product
  
  attr_reader :id
  
  attr_accessor :location_id, :cost, :quantity, :serial_number, :description, 
                :category_id
  
  # Public or Private?: .initialize
  # Gathers arguments (field values) in an options Hash; automatically inserts them into the products table via private method .insert
  #
  # Parameters:
  # + options = {serial_number: Integer, name: String, description: String,     quantity: Integer, cost: Integer, location_id: Integer, category_id: Integer} ##Should we include id? User should never input##
  #
  # Returns: 
  # ???
  # 
  # State Changed:
  # ???
  
  def initialize(options)
    @serial_number = options["serial_number"]
    @description = options["description"]
    @quantity = options["quantity"]
    @cost = options["cost"]
    @location_id = options["location_id"]
    @category_id = options["category_id"]
  end

  
end

binding.pry