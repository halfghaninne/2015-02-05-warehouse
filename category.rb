require 'pry'
require 'sqlite3'

DATABASE = SQLite3::Database.new("warehouse_mgr.db")

class Category
  
  attr_reader :id
  
  def initialize(options)
    @name = options[:name]
    insert
  end
  
  private
  
  def insert
    DATABASE.execute("INSERT INTO categories (name) VALUES ('#{@name}')")
       @id = DATABASE.last_insert_row_id
  end
  
end

