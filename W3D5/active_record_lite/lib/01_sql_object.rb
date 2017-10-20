require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    cols = cols.first
    cols.map! do |col|
      col.to_sym
    end

    @columns = cols
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        attributes[column]
      end

      define_method("#{column}=") do |val|
        attributes[column] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".underscore.pluralize
  end

  def self.all
    parse_all(
      DBConnection.execute(<<-SQL)
        SELECT
          #{self.table_name}.*
        FROM
          #{self.table_name}
      SQL
    )
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    found = DBConnection.execute(<<-SQL, id).first
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
    SQL

    self.new(found) unless found.nil?
  end

  def initialize(params = {})
    params.each do |col, val|
      raise "unknown attribute '#{col}'" unless self.class.columns.include?(:"#{col}")
      self.send "#{col}=", val
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    vals = []
    attributes.each_value do |val|
      vals << val
    end
    vals
  end

  def insert
    col_names = self.class.columns.join(',')
    question_marks = (["?"] * (self.class.columns.length - 1)).join(',')
    id = self.class.all.length + 1
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name}(#{col_names})
      VALUES
        (#{id}, #{question_marks})
    SQL
    self.id = id
  end

  def update
    set_line = self.class.columns.map do |col|
      "#{col} = ?"
    end

    DBConnection.execute(<<-SQL, *attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line.join(',')}
      WHERE
        id = ?
    SQL
  end

  def save
    if self.id.nil?
      self.insert
    else
      self.update
    end
  end
end
