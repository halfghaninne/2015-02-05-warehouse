require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

class Location
  
  attr_reader :id
  
  def initialize(options)
    @city = options[:city]
    insert
  end
  
  private
  
  def insert
    DATABASE.execute("INSERT INTO locations (city) VALUES ('#{@city}')")
       @id = DATABASE.last_insert_row_id
  end
  
end



