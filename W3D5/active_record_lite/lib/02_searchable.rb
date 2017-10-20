require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = []
    vals = []
    params.each do |col, val|
      where_line << col
      vals << val
    end
    where_line.map! { |val| "#{val} = ?" }
    result = DBConnection.execute(<<-SQL, *vals)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line.join(' AND ')}
    SQL

    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
