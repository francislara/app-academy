# Anagrams

# O(n * n!)

a = 'pear'
b = 'reap'
c = 'dog'
d = 'cat'

puts "a = #{a}"
puts "b = #{b}"
puts "c = #{c}"
puts "d = #{d}"

def first_anagrams(string1, string2)
  perm_array = string1.chars.permutation.to_a

  perm_array.map!(&:join)

  perm_array.include?(string2)
end

puts "first_anagrams(a, b) says: #{first_anagrams(a, b)}" # => true
puts "first_anagrams(c, d) says: #{first_anagrams(c, d)}" # => false
#-------------------------------------

# O(n**2)
def second_anagrams(string1, string2)
  arr1, arr2 = string1.chars, string2.chars
  count = 0

  arr1.each do |el|
    if arr2.include?(el)
      arr2.delete_at(arr2.index(el))
      count += 1
    end
  end

  count.times { arr1.pop }

  arr1.empty? && arr2.empty?

end

puts "second_anagrams(a, b) says: #{second_anagrams(a, b)}" # => true
puts "second_anagrams(c, d) says: #{second_anagrams(c, d)}" # => false
#-------------------------------------

# O(n*log(n))
def third_anagrams(string1, string2)
  string1.chars.sort == string2.chars.sort
end

puts "third_anagrams(a, b) says: #{third_anagrams(a, b)}" # => true
puts "third_anagrams(c, d) says: #{third_anagrams(c, d)}" # => false
#-------------------------------------

# O(n)
def fourth_anagrams(string1, string2)
  count1 = Hash.new(0)
  count2 = Hash.new(0)

  string1.each_char { |char| count1[char] += 1 }
  string2.each_char { |char| count2[char] += 1 }

  count1 == count2
end

puts "fourth_anagrams(a, b) says: #{fourth_anagrams(a, b)}" # => true
puts "fourth_anagrams(c, d) says: #{fourth_anagrams(c, d)}" # => false
#-------------------------------------

# O(n)

def bonus_anagrams(string1, string2)
  count = Hash.new(0)

  string1.each_char { |char| count[char] += 1 }
  string2.each_char { |char| count[char] -= 1 }

  count.values.all? { |el| el == 0 }
end

puts "bonus_anagrams(a, b) says: #{bonus_anagrams(a, b)}" # => true
puts "bonus_anagrams(c, d) says: #{bonus_anagrams(c, d)}" # => false
