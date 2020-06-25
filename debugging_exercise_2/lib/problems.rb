# Returns the largest divisor of the number that is also a prime number
def largest_prime_factor(n)
  i = n
  while i > 1
    return i if n % i == 0 && prime?(i)
    i -= 1
  end
end

# Returns a boolean indicating whether or not the given number is prime
def prime?(num)
  return false if num < 2
  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

# Returns true when there are no duplicate characters in the string
def unique_chars?(str)
  hash = Hash.new(0)
  str.each_char { |char| hash[char] += 1 }
  hash.none? { |char, n| n > 1 }
end

# Returns an hash where keys are the elements that were repeated in the array 
# and values are the indices where that element appears
def dupe_indices(arr)
  hash = Hash.new { |hash, k| hash[k] = [] }
  arr.each_with_index { |ele, i| hash[ele] << i }
  hash.select { |ele, arr| arr.length > 1 }
end

# Returns true when the given arrays contain the same elements, in any order
def ana_array(arr_1, arr_2)
  hash_1 = Hash.new(0)
  hash_2 = Hash.new(0)
  arr_1.each { |ele| hash_1[ele] += 1 }
  arr_2.each { |ele| hash_2[ele] += 1 }
  hash_1 == hash_2
end