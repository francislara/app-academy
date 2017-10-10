require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if j == 0
          puts "#{i} #{col}"
        elsif @cursor.cursor_pos == [i, j]
          cursor_spot = col.to_s
          puts " " + cursor_spot.colorize(:blue)
        else
          puts " #{col}"
        end
      end
    end
  end
end
