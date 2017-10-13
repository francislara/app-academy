require 'byebug'

# O(k**n)
def bad_two_sum?(arr, target)
  arr.combination(2).to_a.any? { |pair| pair[0] + pair[1] == target }
end

a = [0, 1, 5, 7]

# puts bad_two_sum?(a, 6)
# puts bad_two_sum?(a, 10)

def okay_two_sum?(arr, target)
  arr.sort!
  i = 0

  while i < j
    case (arr[i] + arr[j]) <=> target
    when -1
      i += 1
    when 0
      return true
    when 1
      j -= 1
    end
  end

  # TODO This is very broken...
  # arr.sort!.each_with_index do |el, i|
  #   arr[idx + 1..-1].bsearch_index do |num|
  #     debugger
  #     case (el + num) <=> target
  #     when 0
  #       return true
  #     end
  #   end
  #
  # end

  false
end

def hash_two_sum?(arr, target)
  hash = Hash.new(target)
  arr.each { |el| hash[el] += 0 }

  hash.each { |k, v| return true if hash.keys.include?(v - k) }

  false
end
puts hash_two_sum?(a, 6)
puts hash_two_sum?(a, 1)
puts hash_two_sum?(a, 4)
puts hash_two_sum?(a, 12)
