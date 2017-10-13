require 'io/console'
require 'benchmark'

#my_min

# O(n**2)
def my_min(list)
  list.each do |num1|
    min = true
    list.each do |num2|
      if num2 < num1
        min = false
      end
    end
    return num1 if min
  end
end

#O(n)
def my_min_n(list)
  list.reduce { |acc, el| el < acc ? el : acc }
end

# Largest Contiguous Sub-sum

def largest_con_sub_sum(list)
  result = []

  list.each_index do |idx1|
    list.each_index do |idx2|
      next if idx2 < idx1
      result << list[idx1..idx2]
    end
  end

  result.map! { |arr| arr.reduce(&:+) }.max
end

def hax_con_sub_sum(list)
  return list.max if list.all? { |el| el < 0 }
  max, sum = 0

  list.each do |num|
    sum += num
    sum = 0 if sum < 0
    max = sum if sum > max
  end

  max
end
