# Towers of Hanoi

class Game

  def initialize
  end

  # ------

end


class Board

  def initialize
  end

end

class Array

  def my_uniq
    self.uniq.sort
  end

  def two_sum
    pairs = []
    self.each_with_index do |num, idx|
      self.each_with_index do |num2, idx2|
        next if idx2 <= idx
          if num + num2 == 0
            pairs << [idx, idx2]
          end
      end
    end
    pairs
  end

  def my_transpose
    sub_arr = []
    transposed_arr = []
    while transposed_arr.length < self.length
      self.each do |array|
        sub_arr << array.shift
      end
      transposed_arr << sub_arr
      sub_arr = []
    end
    transposed_arr
  end
end
