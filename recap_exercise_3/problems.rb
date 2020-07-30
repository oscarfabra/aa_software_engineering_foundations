# Returns a new array containing the elements that were not repeated in arr
def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each { |ele| hash[ele] += 1 }
  arr.select { |ele| hash[ele] == 1 }
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

# Returns true if an element never appears consecutively in the array
def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] == arr[i + 1]
  end
  true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

# Returns a hash containing characters as keys. The value for each key is an
# array containing the indices where that character is found
def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index { |c, i| hash[c] << i }
  hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

# Returns the longest streak of consecutive characters in the string. If there
# are any ties, returns the streak that occurs later in the string.
def longest_streak(str)
  max_length = 0
  max_streak = "" 
  i = 0
  while i < str.length
    c = str[i]
    streak = ""
    while str[i] == c
      streak += c
      i += 1
    end
    if streak.length >= max_length
      max_streak = streak
      max_length = streak.length
    end
  end
  max_streak
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

# Returns a boolean indicating whether or not the number is a bi-prime. 
# A bi-prime is a positive integer that can be obtained by multiplying 
# two prime numbers.
# For Example:
# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24
def bi_prime?(num)
  primes = get_primes_up_to(num / 2)
  (0...primes.length).each do |i|
    (i...primes.length).each do |j|
      return true if primes[i] * primes[j] == num
    end
  end
  false
end

# Returns an array with all the prime numbers up to num
def get_primes_up_to(num)
  (2..num).to_a.select { |n| is_prime?(n) }
end

# Returns true if the given number is a prime
def is_prime?(n)
  return false if n < 2
  (2..n / 2).each { |i| return false if n % i == 0 }
  true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

# A Caesar cipher takes a word and encrypts it by offsetting each letter in the
# word by a fixed number, called the key. Given a key of 3, for example: 
# a -> d, p -> s, and y -> b.
#
# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence 
# of keys is used. For example, if we encrypt "bananasinpajamas" with the key 
# sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":
# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
#
# Accepts a string and a key-sequence as args, and returns the encrypted message. 
# Assumes that the message consists of only lowercase alphabetic characters.
def vigenere_cipher(message, keys)
  alpha = ('a'..'z').to_a
  arr = message.split("").map.with_index do |c, i|
    offset = keys[i % keys.length]
    new_letter_i = (alpha.index(c) + offset) % alpha.length
    alpha[new_letter_i]
  end
  arr.join
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# Returns the string where every vowel is replaced with the vowel the appears 
# before it sequentially in the original string. The first vowel of the string 
# should be replaced with the last vowel.
def vowel_rotate(str)
  vowels = "aeiou"
  vowels_in_str = []
  str.each_char { |c| vowels_in_str << c if vowels.include?(c) }
  vowels_in_str.unshift(vowels_in_str.pop)
  arr = str.split("").map do |c|
    (vowels.include?(c))? vowels_in_str.shift : c
  end
  arr.join
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
  # Returns a new string containing characters of the original string that return
  # true when passed into the block. If no block is passed, then it returns the
  # empty string. Must not use Array#select.
  def select(&prc)
    prc ||= Proc.new { }
    new_str = ""
    self.each_char { |c| new_str += c if prc.call(c) }
    new_str
  end

  # Modifies the existing string by replacing every character with the result of 
  # calling the block, passing in the original character and its index. Must not
  # use Array#map or Array#map!.
  def map!(&prc)
    self.each_char.with_index do |c, i|
      self[i] = prc.call(c, i)
    end
  end
end

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

# Returns the product of a and b, recursively and without using the multiplication
# operator (*)
def multiply(a, b)
  return 0 if a == 0 || b == 0
  return a + multiply(a, b - 1) if b > 0
  return b + multiply(a - 1, b) if a > 0
  return -a + multiply(a, b + 1) if a < 0 && b < 0
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

# The Lucas Sequence is a sequence of numbers. The first number of the sequence 
# is 2. The second number of the Lucas Sequence is 1. To generate the next number
# of the sequence, we add up the previous two numbers. For example, the first six
# numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...
#
# Accepts a number representing a length as an arg. The method returns an array 
# containing the Lucas Sequence up to the given length. A recursive method.
def lucas_sequence(length)
  return [] if length == 0
  return [2] if length == 1
  return [2, 1] if length == 2
  lucas_sequence(length - 1) + [lucas_sequence(length - 1)[-2] + lucas_sequence(length - 1)[-1]]
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

# The Fundamental Theorem of Arithmetic states that every positive integer is 
# either a prime or can be represented as a product of prime numbers.
#
# Accepts a number and returns an array representing the prime factorization 
# of the given number. This means that the array should contain only prime 
# numbers that multiply together to the given num. The array returned should 
# contain numbers in ascending order. A recursive method.
def prime_factorization(num)
  i = 2
  i += 1 until num % i == 0
  return [num] if num == i
  [i] + prime_factorization(num / i)
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]