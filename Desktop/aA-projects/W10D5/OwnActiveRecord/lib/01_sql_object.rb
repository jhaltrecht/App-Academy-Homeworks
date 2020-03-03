require_relative 'db_connection'
require 'active_support/inflector'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      return @cols if @cols
      @cols= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @cols=@cols.first.map {|title| title.to_sym}
  end

  def self.finalize!
    self.columns.each do |col|
      define_method(col) { self.attributes[col]}
      define_method("#{col}=") { |other_val| self.attributes[col]=other_val}
    end
  end

  def self.table_name=(table_name)
    @table_name=table_name
  end

  def self.table_name
    @table_name||=self.to_s.tableize
  end

  def self.all
   results= DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM 
      #{self.table_name}

    SQL
    self.parse_all(results)

  end

  def self.parse_all(results)
    results.map! {|result| self.new(result)}
  end

  def self.find(id)
    results=DBConnection.execute(<<-SQL,id)
    SELECT
      *
    FROM 
      #{self.table_name}
    WHERE
      id=?
    SQL
    return nil unless results
    self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name,val|
      attr_name=attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name)
      self.send("#{attr_name}=",val)
    end
  end

  def attributes
    @attributes ||={}
  end

  def attribute_values
    self.class.columns.map{|attr_value| self.send(attr_value)}
  end


  def insert
    # drop 1 for the id
    columns = self.class.columns.drop(1)
    col_names=columns.map(&:to_s).join(",")
    question_marks=(["?"] * columns.size).join(",")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
     INSERT INTO 
       #{self.class.table_name} (#{col_names})
     VALUES 
       (#{question_marks})
     SQL
     self.id=DBConnection.last_insert_row_id



  end

  def update
    set=self.class.columns.map{|attr_name| "#{attr_name} = ?"}.join(",")
    DBConnection.execute(<<-SQL, *attribute_values,id)
     UPDATE
       #{self.class.table_name}
     SET 
       #{set}
      WHERE
      #{self.class.table_name}.id=?
     SQL

  end

  def save
    if !id
      insert
    else update
    end

  end


  
end
